//
//  ProudectView.swift
//  HomeMade
//
//  Created by user1 on 25/06/1447 AH.
//

import SwiftUI

struct ProudectView: View {
    @State private var image = ["2","3","4","5","2","3","4","5"]
    var body: some View {
        ScrollView(.vertical){
            ForEach(image, id: \.self){ item in
                HStack {
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    
                    
                    
                    VStack(alignment: .leading){
                        Text("Food")
                            .font(.title3)
                            .foregroundStyle(.black)
                        Text("Delicious things we eat to enjoy and stay healthy")
                            .foregroundStyle(Color(.color))
                            .font(.caption)
                            .lineLimit(2)
                        
                    }
                    .padding(8)
                }
                .padding(6)
                .frame(width: 360, height: 114)
                .background(Color(.white))
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .shadow(color: Color(.color),radius: 6)
                .padding(.horizontal)
                .padding(.vertical,7)
                
            }
            
        }
        
    }
}

#Preview {
    ProudectView()
}
