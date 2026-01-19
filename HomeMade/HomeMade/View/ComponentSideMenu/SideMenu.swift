//
//  SideMenuView.swift
//  HomeMade
//
//  Created by user1 on 28/07/1447 AH.
//

import SwiftUI

struct SideMenu: View {
    @State private var showMenu = false
    var body: some View {
        NavigationStack{
            VStack{
                
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        showMenu.toggle()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                        
                    }

                }
            }
        }
    }
}

#Preview {
    SideMenu()
}
