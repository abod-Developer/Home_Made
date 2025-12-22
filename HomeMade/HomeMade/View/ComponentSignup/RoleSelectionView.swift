//
//  RoleSelectionView.swift
//  HomeMade
//
//  Created by user1 on 02/07/1447 AH.
//

import SwiftUI

struct RoleSelectionView: View {
    @State private var selectRole : String? = nil
    var body: some View {
        VStack(spacing : 8){
            NavigationStack{
                VStack(spacing : 20){
                    // this title qustion the user
                    Text("اختر نوع الحساب")
                    
                    // this customer buttons
                    Button {
                        
                    } label: {
                        Text("عميل")
                            .frame(width: 300, height: 48)
                           
                            .background(.blue)
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                    
                    
                     // this is fimaly buttons
                    
                    Button {
                        
                    } label: {
                        Text("اسر منتجة")
                            .frame(width: 300, height: 48)
                            .background(.blue)
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }

                    
                }
                NavigationLink(
                    "", destination: SignupView(role : selectRole ?? "")
                )
                
                    
                
            }
        }
    }
}

#Preview {
    RoleSelectionView()
}
