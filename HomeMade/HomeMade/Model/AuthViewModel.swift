//
//  Authentication.swift
//  HomeMade
//
//  Created by user1 on 25/06/1447 AH.
//

import Foundation
import FirebaseAuth
import SwiftUI
import Combine


class AuthViewModel: ObservableObject{
    @Published var isLoggedIn : Bool = false
    @Published var error : String = ""
    
    
    func login(email : String, password : String){
        
        Auth.auth().signIn(withEmail: email, password: password){ result , error in
            
            if let error = error {
                self.error = error.localizedDescription
                return
            }
            
            self.isLoggedIn = true
        }
    }
    
    
    func signup(email: String , password : String , confirmPassword : String){
        guard password == confirmPassword else {
            self.error = "The Password and confirm passwors do not match"
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                self.error = error.localizedDescription
                return
            }
            self.isLoggedIn = true
        }
    }
    
    
    func signout(email : String , password : String){
        do{
            try Auth.auth().signOut()
            self.isLoggedIn = false
        }catch{
            self.error = "فشل في تسجيل الخروج"
        }
        
    }
    
    
    
}
