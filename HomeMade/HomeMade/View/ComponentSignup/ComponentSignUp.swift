//
//  ComponentTextField.swift
//  HomeMade
//
//  Created by user1 on 29/06/1447 AH.
//

import SwiftUI

struct ComponentTextField: View {
    @State private var isOpenEye: Bool = false
    @EnvironmentObject var authVM : AuthViewModel
    var body: some View {
        VStack{
            TextField(text: $authVM.email) {
                Text("Username")
                    .foregroundStyle(.gray)
                    .onChange(of: authVM.email){
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
                    .foregroundStyle(.color)
            }
            
            HStack {
                if isOpenEye {
                    TextField(text: $authVM.password) {
                        Text("Password")
                            .foregroundStyle(.gray)
                            .onChange(of: authVM.password){
                                authVM.error = ""
                            }
                    }
                } else {
                    SecureField(text: $authVM.password) {
                        Text("Password")
                            .foregroundStyle(.gray)
                            .onChange(of: authVM.password){
                                authVM.error = ""
                            }
                    }
                }
                Button {
                    isOpenEye.toggle()
                } label: {
                    Image(systemName: isOpenEye ? "eye" : "eye.slash")
                        .foregroundStyle(.color)
                }
            }
            .padding(.horizontal)
            .frame(width: 300, height: 48)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .overlay {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(lineWidth: 1.5)
                    .foregroundStyle(.color)
            }
            
            HStack{
                if isOpenEye {
                    TextField(text: $authVM.confirmPassword) {
                        Text("Confirm Password")
                            .foregroundStyle(.gray)
                            .onChange(of: authVM.confirmPassword){
                                authVM.error = ""
                            }
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled(true)
                    }
                } else{
                    SecureField(text: $authVM.confirmPassword){
                        Text("Confirm Password")
                            .foregroundStyle(.gray)
                            .onChange(of: authVM.confirmPassword){
                                authVM.error = ""
                            }
                    }
                }
                
                Button {
                    isOpenEye.toggle()
                } label: {
                    Image(systemName: isOpenEye ? "eye" : "eye.slash")
                        .foregroundStyle(.color)
                }
            }
            .padding(.horizontal)
            .frame(width: 300, height: 48)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .overlay {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(lineWidth: 1.5)
                    .foregroundStyle(.color)
            }
            
            
            
            Button {
                authVM.signup(role: .customer)
            
            } label: {
                Text("Sign Up")
                    .bold()
                    .foregroundStyle(.white)
            }
            .frame(width: 300,height: 48)
            .background(Color(.color))
            .clipShape(RoundedRectangle(cornerRadius: 400))
            
            if !authVM.error.isEmpty{
                Text(authVM.error)
                    .foregroundStyle(.red)
                    .frame(width: 300, height: 48)
                  // .background(.black)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            
        }
    }
}
#Preview {
    ComponentTextField()
        .environmentObject(AuthViewModel())
    
}
