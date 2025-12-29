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

                  
                    
                }
            }
        }
    }
}
#Preview {
    SignupView( role: "")
        .environmentObject(AuthViewModel())
}


