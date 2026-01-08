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
            
            
       
    }
    
    func login(email : String , password: String) async{
        isLoggedIn = true
        defer{isLoggedIn = false}
        
        do{
            // نطلب من سوبايس يسجل دخول
            try await client.auth.signIn(email: email, password: password)
            print("You have been logged in successfully")
            // بعد نجاح العمليه نجيب بيانات المستخدم
            self.user = client.auth.currentUser
            
        }catch{
            self.error = error.localizedDescription
            print("Login Error \(error)")
        }
        

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
