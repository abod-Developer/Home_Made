//
//  AuthView.swift
//  HomeMade
//
//  Created by user1 on 03/07/1447 AH.
//

import SwiftUI

struct AuthView: View {
    let role : String // type account your coming from RoleSelectedView
    var body: some View {
        VStack(spacing: 20){
            Text(role == "family" ? "Customer" : "Proudcut Family")
                .font(.title              )
        }
    }
}

#Preview {
    AuthView(role: "")
}
