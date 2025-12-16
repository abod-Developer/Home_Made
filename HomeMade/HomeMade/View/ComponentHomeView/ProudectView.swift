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
                            .font(.title2)
                            .foregroundStyle(.orange)
                        Text("Delicious things we eat to enjoy and stay healthy")
                            .foregroundStyle(.orange.opacity(0.8))
                            .font(.caption)
                            .lineLimit(2)
                        
                    }
                }
                .padding(8)
                .frame(width: 366, height: 114)
                .background(Color(red: 0.1, green: 0.1, blue: 0.1).opacity(0.8))
                .clipShape(RoundedRectangle(cornerRadius: 16))
                
                
                
            }
        }
    }
}

#Preview {
    ProudectView()
}
