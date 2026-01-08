//
//  ProfileView.swift
//  HomeMade
//
//  Created by user1 on 28/06/1447 AH.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var authVM : AuthViewModel
    var body: some View {
        ScrollView {
            VStack{
                
                //image and info
                HStack{
                    Button {
                        Task {
                             await authVM.signout()
                        }
                        
                    } label: {
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                            .foregroundStyle(.red)
                        
                    }
                  
                   // .padding(5)

                    Spacer()
                    VStack(spacing: 10){
                        Text("عبدالله")
                            .fontWeight(.bold)
                        
                        Text("0535176889")
                    }
                    Image(.images1)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                    
                        .padding(.horizontal,5)
                    
                    
                }
                .padding(.horizontal)
                SummaryBar()
                    .frame(width: 350,height: 48)
                    .padding()
                    .background(Color(.systemGray6)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .padding()
                
                Spacer()
                
                
                
            }
        }
    }
}

#Preview {
    ProfileView()
     .environmentObject(AuthViewModel())
}
