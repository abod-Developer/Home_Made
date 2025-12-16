//
//  SignupView.swift
//  HomeMade
//
//  Created by user1 on 08/06/1447 AH.
//

import SwiftUI

struct SignupView: View {
    @State private var username : String = ""
    @State private var password : String = ""
    @State private var confirmPassword : String = ""
    @State private var isOpenEye: Bool = false
    @StateObject var authVM = AuthViewModel()
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 40)
            
                .frame(width: 344, height:400 )
                .foregroundStyle(Color(.darkGray))
            
            VStack(spacing: 24){
                //Text
                Text("Sign Up")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.orange)
                
                // Text Field
                VStack(spacing:16){
                    TextField(text: $username) {
                        Text("Username")
                            .foregroundStyle(.gray)
                            .onChange(of: username){
                                authVM.error = ""
                            }
                            
                    }
                    .padding(.horizontal)
                    .frame(width: 300, height: 48)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .overlay {
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(lineWidth: 1.5)
                            .foregroundStyle(.orange)
                    }
                    
                    HStack {
                        if isOpenEye {
                            TextField(text: $password) {
                                Text("Password")
                                    .foregroundStyle(.gray)
                                    .onChange(of: password){
                                        authVM.error = ""
                                    }
                            }
                        } else {
                            SecureField(text: $password) {
                                Text("Password")
                                    .foregroundStyle(.gray)
                                    .onChange(of: password){
                                        authVM.error = ""
                                    }
                            }
                        }
                        Button {
                            isOpenEye.toggle()
                        } label: {
                            Image(systemName: isOpenEye ? "eye" : "eye.slash")
                                .foregroundStyle(.orange)
                        }
                    }
                    .padding(.horizontal)
                    .frame(width: 300, height: 48)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .overlay {
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(lineWidth: 1.5)
                            .foregroundStyle(.orange)
                    }
                    
                    HStack{
                        if isOpenEye {
                            TextField(text: $confirmPassword) {
                                Text("Confirm Password")
                                    .foregroundStyle(.gray)
                                    .onChange(of: confirmPassword){
                                        authVM.error = ""
                                    }
                            }
                        } else{
                            SecureField(text: $confirmPassword){
                                Text("Confirm Password")
                                    .foregroundStyle(.gray)
                                    .onChange(of: confirmPassword){
                                        authVM.error = ""
                                    }
                            }
                        }
                        
                        Button {
                            isOpenEye.toggle()
                        } label: {
                            Image(systemName: isOpenEye ? "eye" : "eye.slash")
                                .foregroundStyle(.orange)
                        }
                    }
                    .padding(.horizontal)
                    .frame(width: 300, height: 48)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .overlay {
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(lineWidth: 1.5)
                            .foregroundStyle(.orange)
                    }
                    //button Sign Up
                   
                   
                }
              
                VStack {
                    Button {
                        authVM.signup(email: username, password: password, confirmPassword: confirmPassword)
                    } label: {
                        Text("Sign Up")
                            .bold()
                            .foregroundStyle(.orange)
                    }
                    .frame(width: 300,height: 48)
                    .background(Color(red: 0.5, green: 0.3, blue: 0.0))
                    .clipShape(RoundedRectangle(cornerRadius: 400))

                }
                if !authVM.error.isEmpty{
                    
                    Text(authVM.error)
                        .foregroundStyle(.red)
                        .frame(width: 300, height: 48)
                        .background(.black)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
               
            }
        }
    }
}

#Preview {
    SignupView()
}


