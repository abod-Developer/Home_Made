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
                    .foregroundStyle(Color(.background))
                VStack(alignment: .center, spacing:24){
                    
                    // sign in
                    ComponentSignin()
                        
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
