//
//  SignInView.swift
//  HomeMade
//
//  Created by user1 on 08/06/1447 AH.
//

import SwiftUI

struct SignInView: View {
    @State var username : String = ""
    @State var password : String = ""
    @State private var isOpenEye: Bool = false
    @State private var showSignUp = false
    @StateObject var authVM = AuthViewModel()
  
    var body: some View {
        NavigationStack {
            ZStack {
                RoundedRectangle(cornerRadius: 40)
                
                    .frame(width: 344, height:400 )
                    .foregroundStyle(Color(.darkGray))
                VStack(alignment: .center, spacing:24){
                    Text("Sign In")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundStyle(.orange)
                    
                    VStack(spacing: 16){
                        TextField(text: $username, label: {
                            Text("Username")
                                .foregroundStyle(.gray)
                            
                            // add this is  becusea if user edit error the message disappers
                                .onChange(of: username){
                                    authVM.error = "" 
                                }
                        })
                        .padding(.horizontal)
                        .frame(width: 300,height: 48)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .overlay {
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(lineWidth: 2)
                                .foregroundStyle(.orange)
                        }
                        
                        
                        HStack {
                            TextField(text: $password, label: {
                                Text("Password")
                                    .foregroundStyle(.gray)
                                
                                // add this becusae if user edit error the message disappears
                                    .onChange(of: password){
                                        authVM.error = ""
                                    }
                                
                            })
                            
                            // If you intended a visible border, consider using an overlay with a small lineWidth:
                            //.overlay(RoundedRectangle(cornerRadius: 16).stroke(.orange, lineWidth: 1))
                            
                            Button {
                                isOpenEye.toggle()
                            } label: {
                                Image(systemName: isOpenEye ? "eye" : "eye.slash")
                                    .foregroundStyle(.orange)
                            }
                            
                        }
                        .padding(.horizontal)
                        .frame(width: 300,height: 48)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .overlay {
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(lineWidth: 2)
                                .foregroundStyle(.orange)
                            
                        }
                        
                    }
                    VStack(spacing: 16) {
                        Button {
                            authVM.login(email: username, password: password)
                            
                            
                        } label: {
                            Text("Sign In")
                                .bold()
                                .foregroundStyle(.orange)
                        }
                        .frame(width: 300,height: 48)
                        .background(Color(red: 0.5, green: 0.3, blue: 0.0))
                        .clipShape(RoundedRectangle(cornerRadius: 400))
                        
                        // show Error Massage
                        if !authVM.error.isEmpty{
                            Text(authVM.error)
                                .foregroundStyle(.red)
                                .frame(width: 300, height: 48)
                                .background(.black)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        }
                        
                        
                        
                        
                        NavigationLink(destination: SignupView(role: "")) {
                            HStack {
                                Text("Don't have an account?")
                                    .foregroundStyle(Color(red: 0.9, green: 0.6, blue: 0.0))
                                Text("Sign Up")
                                    .foregroundStyle(.orange)
                                    .bold()
                            }
                        }
                        
                        
                        
                        HStack(spacing: 8){
                            Image(.image3)
                            Image(.image2)
                        }
                        
                    }
                }
            }
        }
    }
}
#Preview {
    SignInView()
        .environmentObject(AuthViewModel())
}
