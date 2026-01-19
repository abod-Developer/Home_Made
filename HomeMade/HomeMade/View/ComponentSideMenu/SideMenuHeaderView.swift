//
//  SideMenuHeaderView.swift
//  HomeMade
//
//  Created by user1 on 29/07/1447 AH.
//

import SwiftUI

struct SideMenuHeaderView: View {
    @StateObject private var authVM = AuthViewModel()
    var body: some View {
        HStack{
            Image(.images1)
                .resizable()
                .scaledToFit()
                .imageScale(.large)
                .frame(width: 48, height: 48)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.vertical)
            
            VStack(alignment: .leading,spacing: 6){
                Text("عبدالله")
                    .font(.subheadline)
                
                Text(authVM.email)
                    .font(.footnote)
                    .foregroundStyle(.gray)
                
                
            }
        }
    }
}

#Preview {
    SideMenuHeaderView()
}
