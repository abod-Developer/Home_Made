//
//  ComponentTextField.swift
//  HomeMade
//
//  Created by user1 on 29/06/1447 AH.
//

import SwiftUI

struct ComponentTextField: View {
    @State private var username : String = ""
    @State private var password : String = ""
    @State private var confirmPassword : String = ""
    @State private var isOpenEye: Bool = false
    @EnvironmentObject var authVM : AuthViewModel
    var body: some View {
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
                .foregroundStyle(.color)
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
                TextField(text: $confirmPassword) {
                    Text("Confirm Password")
                        .foregroundStyle(.gray)
                        .onChange(of: confirmPassword){
                            authVM.error = ""
                        }
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled(true)
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
    }
}

#Preview {
    ComponentTextField()
}
