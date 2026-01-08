//
//  RootView.swift
//  HomeMade
//
//  Created by user1 on 26/06/1447 AH.
//

import SwiftUI


struct RootView: View {
    @EnvironmentObject var authVM : AuthViewModel
    
    var body: some View {
        if authVM.isLoggedIn{
            HomeView()
             
        }else{
           RoleSelectionView()
               
        }
    }
}

#Preview {
    RootView()
        .environmentObject(AuthViewModel())
}

