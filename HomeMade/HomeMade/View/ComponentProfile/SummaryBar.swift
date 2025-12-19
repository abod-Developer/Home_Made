//
//  SummaryBar.swift
//  HomeMade
//
//  Created by user1 on 28/06/1447 AH.
//

import SwiftUI

struct SummaryBar: View {
    var body: some View {
        HStack{
         statItem(title: "المشتريات", value: 2)
                Divider()
            statItem(title: " المبيعات المكتمله", value: 2)
            Divider()
            statItem(title: "المبيعات النشطة", value: 2)
            Divider()
            statItem(title: "اجمالي المبيعات", value: 2)
            Divider()
        }
       
    }
    func statItem(title : String , value : Int) -> some View{
        VStack(spacing : 6){
            Text(title)
                
                .font(.footnote.bold())
                .foregroundStyle(.gray)
                .lineLimit(2)
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
