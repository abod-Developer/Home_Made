//
//  SideMenuView.swift
//  HomeMade
//
//  Created by user1 on 28/07/1447 AH.
//

import SwiftUI

struct SideMenuView: View {
    // هذا المتغير نتحكم في ظهور القائمة الجانبيه
    @Binding var isShowing : Bool
    var body: some View {
        ZStack{
            // هنا نحط شرط اذا كانت القائمة ظاهره
            if isShowing{
                HomeView()
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {isShowing.toggle()}
                
                HStack{
                    VStack(alignment: .leading, spacing: 32){
                        SideMenuHeaderView()
                        
                        
                        Spacer()
                    }
                    .background(.white)
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    SideMenuView(isShowing: .constant(true))
}
