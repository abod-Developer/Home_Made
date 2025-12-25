//
//  ComponentSignin.swift
//  HomeMade
//
//  Created by user1 on 04/07/1447 AH.
//

import SwiftUI

struct ComponentSignin: View {
    @State var username : String = ""
    @State var password : String = ""
    @State private var isOpenEye: Bool = false
    @StateObject var authVM = AuthViewModel()
    var body: some View {
        VStack(spacing: 16){
            Text("Sign In")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(.color)
            
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
                    .foregroundStyle(.color)
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
                
                
                Button {
                    isOpenEye.toggle()
                } label: {
                    Image(systemName: isOpenEye ? "eye" : "eye.slash")
                        .foregroundStyle(.color)
                }
                
            }
            .padding(.horizontal)
            .frame(width: 300,height: 48)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .overlay {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(lineWidth: 2)
                    .foregroundStyle(.color)
                
            }
            
        }
        VStack(spacing: 16) {
            Button {
                authVM.login(email: username, password: password)
                
                
            } label: {
                Text("Sign In")
                    .bold()
                    .foregroundStyle(.white)
            }
            .frame(width: 300,height: 48)
            .background(Color(.color))
            .clipShape(RoundedRectangle(cornerRadius: 400))
            
            // image Apple and Google
            HStack(spacing: 8){
                Image(.image4)
                    .resizable()
                    .frame(width: 50, height: 50)
                    
                
                Image(.image5)
                    .resizable()
                    .frame(width: 50, height: 50)
            }
            
        }
    }
}

#Preview {
    ComponentSignin()
}
