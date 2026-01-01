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
    @EnvironmentObject var authVM : AuthViewModel
    @State var userRole : UserRole = .customer
  
    var body: some View {
        NavigationStack {
            ZStack {
                RoundedRectangle(cornerRadius: 40)
                
                    .frame(width: 344, height:400 )
                    .foregroundStyle(Color(.background))
                VStack(alignment: .center, spacing:24){
                    
                    // sign in
                    ComponentSignin()
                        
                       
                       
                        
                        
                        
                        
                    NavigationLink(destination: SignupView( role: "")) {
                            HStack {
                                Text("Don't have an account?")
                                    .foregroundStyle(Color(.color))
                                Text("Sign Up")
                                    .foregroundStyle(.color)
                                    .bold()
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
