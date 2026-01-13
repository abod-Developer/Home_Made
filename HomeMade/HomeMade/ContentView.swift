//
//  ContentView.swift
//  HomeMade
//
//  Created by user1 on 07/06/1447 AH.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    @StateObject var authViewModel = AuthViewModel()
    @State private var showingAddProduct = false
    var body: some View {
        ZStack(alignment: .bottom){
            
            TabView(selection: $selectedTab){
                Text("Home")
                    .tabItem {
                        Label("Home",systemImage: "house")
                    }
                    .tag(0)
                
                Text("")
                    .tabItem {EmptyView()}
                    .tag(1)
                
                Text("Account")
                    .tabItem {
                        Label("Profile",systemImage: "person.fill")
                            .tag(2)
                    }
                if authViewModel.userRole == .family{
                    Button {
                        showingAddProduct = true
                    } label: {
                        Image(systemName: "plus")
                            .font(.title.bold())
                            .foregroundStyle(.color)
                            .frame(width: 56,height: 56)
                            .background(.white)
                            .clipShape(.circle)
                            .shadow(radius: 4)
                    }
                    .padding()

                }
            }
            .sheet(isPresented: $showingAddProduct){
                 }
          
        }
    }
}

#Preview {
    
}
