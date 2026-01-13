//
//  Authentication.swift
//  HomeMade
//
//  Created by user1 on 25/06/1447 AH.
//

import Foundation

import SwiftUI
import Combine
import Supabase



class AuthViewModel: ObservableObject{
    let client = SupabaseConfig.client
    @Published var user : User? = nil
    @Published var email : String = ""
    @Published var password : String = ""
    @Published var confirmPassword : String = ""
    @Published var isLoggedIn : Bool = false
    @Published var error : String = ""
    @Published var userRole :UserRole? = nil
    
    
    
    func checkSession() async{

            if let session = try? await client.auth.session{
                await MainActor.run{
                    self.user = session.user
                    self.isLoggedIn = true
                    
                }
               
            }else{
                // اذا مافيه جلسه 
                await MainActor.run {
                    self.isLoggedIn = false
                }
            }
        print("مشكله تسجيل الدخول ")
            
            
       
    }
    
    func login(email : String , password: String) async{
        // نتاكد ان الايميل و الباسورد مهب فاضين
        guard !email.isEmpty && !password.isEmpty else{
            await MainActor.run{self.error = "Email/Password missing"}
            return
        }
    
        do{
            // نطلب من سوبايس يسجل دخول
            let response = try await client.auth.signIn(email: email, password: password)
            print("You have been logged in successfully")
            // بعد نجاح العمليه نجيب بيانات المستخدم
            //self.user = client.auth.currentUser
            // اذا نجحت العمليه نحدث MainActor
            await MainActor.run {
                self.user = response.user
                self.isLoggedIn = true
                self.error = ""
                
            }
            
        }catch{
            await MainActor.run {
                self.error = error.localizedDescription
                self.isLoggedIn = false
                print("Login Error \(error)")
            }
          
        }
        
        print("erorrrrrrrrrrrrrr")
        

    }
    
    
    func signup(role : UserRole ) async{
        guard password == confirmPassword else {
            self.error = "The Password and confirm passwors do not match"
            return
        }
        
        let cleanPassword = password.trimmingCharacters(in: .whitespacesAndNewlines)
        guard cleanPassword.count >= 5 else{
            self.error = "كلمة المرور يجب ان تكون 6 حروف على الاقل"
            return
        }
        
        do{
            let authResponse = try? await client.auth.signUp(email: email, password: password)
            // المستخدم الي توه مسجل عشان نحفظه في جدولنا نحتاج ال id حقه
            guard let userid = authResponse?.user.id else{return}
            
            
            try await client.from("profiles").insert([
                "id" : userid.uuidString,
                "email" : email,
                "role" : role == .family ? "family" : "customer"
            ]).execute()
            print("THE ACCOUNT HAS BEEN SUCCESSFULLY CREATED")
            isLoggedIn = true
        }catch{
            self.error = error.localizedDescription
            print("craeted account Error")
        }
    }
    
    
    func signout() async{
        print("error in sing out")
        do{
            // هنا نطلب من سوبايس انهى الجلسه
            try await client.auth.signOut()
            self.user = nil
            self.isLoggedIn = false
        }catch{
            self.error = "Filed to log out\(error.localizedDescription)" 
           
        }
        
    }
    
    

    
    
}
