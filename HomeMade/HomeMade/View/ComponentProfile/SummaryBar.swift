//
//  SummaryBar.swift
//  HomeMade
//
//  Created by user1 on 28/06/1447 AH.
//

import SwiftUI

struct SummaryBar: View {
    @State private var animateViews = false
    var body: some View {
        
            HStack{
                if animateViews{
                    statItem(title: "المشتريات", value: 2)
                    
                    Divider()
                    statItem(title: " المبيعات المكتمله", value: 0)
                    Divider()
                    statItem(title: "المبيعات النشطة", value: 3)
                    Divider()
                    statItem(title: "اجمالي المبيعات", value: 2)
                    Divider()
                    
                }
            }
            .frame(width: 380, height: 48)
            .transition(.slide)
            .animation(.easeInOut(duration: 1), value: animateViews)
            
            .onAppear{
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                    animateViews = true
                }
            }
        
    }
    func statItem(title : String , value : Int) -> some View{
        VStack(spacing : 6){
            Text(title)
                
                .font(.footnote.bold())
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: true, vertical: true)
            Text("\(value)")
                .foregroundStyle(.black)
                .bold()
        
        }
        
        .background(
        
            RoundedRectangle(cornerRadius: 4)
                .fill(Color(.systemGray6))
        )
        
    }
}


#Preview {
    SummaryBar()
}
