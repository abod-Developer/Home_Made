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
    @State private var selectedRole : UserRole = .customer
    @StateObject var authVM = AuthViewModel()
    
    let role : String
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 40)
                .fill(Color(.background))
            
                .frame(width: 344, height:500 )
                //.foregroundStyle(Color(.color))
            
            VStack(spacing: 24){
                //Text
                Text("Sign Up")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.color)
                
                // Text Field
                VStack(spacing:16){
                    // textField
                    ComponentTextField()

                    
                    VStack {
                        Button {
                            authVM.signup(
                                email: username,
                                password: password,
                                confirmPassword: confirmPassword,
                                role: selectedRole
                                
                            )
                            print("pqassword", password.count)
                        } label: {
                            Text("Sign Up")
                                .bold()
                                .foregroundStyle(.white)
                        }
                        .frame(width: 300,height: 48)
                        .background(Color(.color))
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
}
#Preview {
    SignupView(role: "")
        .environmentObject(AuthViewModel())
}


