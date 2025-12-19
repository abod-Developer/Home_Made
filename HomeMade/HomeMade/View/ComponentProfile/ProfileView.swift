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
        VStack{
            
            //image and info
            HStack{
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
            
            SummaryBar()
                .frame(width: 380,height: 48)
                .padding(.top)
                .background(Color(.systemGray6)
                )
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding()
                
           Spacer()
            
            
            
        }
    }
}

#Preview {
    ProfileView()
        .environmentObject(AuthViewModel())
}
