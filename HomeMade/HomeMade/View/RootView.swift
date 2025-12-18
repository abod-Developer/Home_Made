//
//  RootView.swift
//  HomeMade
//
//  Created by user1 on 26/06/1447 AH.
//

import SwiftUI

struct RootView: View {
    @StateObject private var authVm = AuthViewModel()
    var body: some View {
        if authVm.isLoggedIn{
            HomeView()
                .environmentObject(authVm)
        }else{
            SignInView()
                .environmentObject(authVm)
        }
    }
}

#Preview {
    RootView()
}
