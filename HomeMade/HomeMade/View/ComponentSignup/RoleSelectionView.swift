//
//  RoleSelectionView.swift
//  HomeMade
//
//  Created by user1 on 02/07/1447 AH.
//

import SwiftUI

struct RoleSelectionView: View {
    @State private var selectRole: String? = nil

    var body: some View {
        VStack(spacing: 8) {
           
            NavigationStack {
                ZStack {
              Color("BackgroundColor")
                        .ignoresSafeArea()
                    VStack(spacing: 20) {
                        Image("appstore")
                            .resizable()
                            .scaledToFit()
                            
                        Spacer()
                        // this title qustion the user
                        Text("Select The Account Type")
                            .font(.headline)
                            .fontWeight(.bold)
                            .padding(.bottom)

                        // this customer buttons
                        Button {
                            selectRole = "customer"
                        } label: {
                            Text("Custmer")
                                .font(.headline)
                                .frame(width: 300,height: 48)
                                .background(Color(.color))
                                .foregroundStyle(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 400))
                        }

                        // this is fimaly buttons
                        Button {
                            selectRole = "family"
                        } label: {
                            Text("Productive Family")
                                .font(.headline)
                                .frame(width: 300,height: 48)
                                .background(Color(.color))
                                .foregroundStyle(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 400))
                        }
                        
                        
                        
                        
                      
                    }
                    .padding(.bottom,100)
                }

                // Programmatic navigation link (no title string, provide a label closure)
                NavigationLink(
                    destination: SignupView(role: selectRole ?? ""),
//                    isActive: Binding(
//                        get: { selectRole != nil },
//                        set: { if !$0 { selectRole = nil } }
//                    )
                )// end navigationLink Beacus hidden the space white
                {
                    EmptyView()
                }
                .toolbar(.hidden, for: .navigationBar)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    RoleSelectionView()
}
