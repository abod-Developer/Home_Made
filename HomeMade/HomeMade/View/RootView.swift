//
//  RootView.swift
//  HomeMade
//
//  Created by user1 on 26/06/1447 AH.
//

import SwiftUI
import FirebaseAuth

struct RootView: View {
    @State private var isLoggedIn = Auth.auth().currentUser != nil
    
    var body: some View {
        if isLoggedIn{
            HomeView()
              
        }else{
           RoleSelectionView()
               
        }
    }
}

#Preview {
    RootView()
}

