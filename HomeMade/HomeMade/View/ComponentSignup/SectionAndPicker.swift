//
//  SectionAndPicker.swift
//  HomeMade
//
//  Created by user1 on 29/06/1447 AH.
//

import SwiftUI

struct SectionAndPicker: View {
    @State private var selectedRole : UserRole = .customer
    var body: some View {
        Section{
            Text("نوع الحساب ")
                .foregroundStyle(.white)

                .bold()
            Picker("نوع الحساب", selection: $selectedRole) {
                ForEach(UserRole.allCases,id: \.self){ role in
                    Text(role.rawValue)
                        .tag(role)
                }
                .pickerStyle(.inline)
                
                
                //button Sign Up
                
            }
            .frame(width: 300, height: 48)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius:16))
        }
    }
}

#Preview {
    SectionAndPicker()
}
