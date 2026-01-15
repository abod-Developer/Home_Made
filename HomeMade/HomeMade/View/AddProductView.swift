//
//  AddProductView.swift
//  HomeMade
//
//  Created by user1 on 25/07/1447 AH.
//

import SwiftUI

struct AddProductView: View {
    @State private var mainCategory = "Handicraft"
    @State private var supCategory = ""
    
    
    @State private var typeProduct = ["Handicrafts","Food","Sweets"]
    @State private var typeProduct1 = ["Handicrafts","Food","Sweets"]
    @State private var animations = false
    var body: some View {
        VStack(spacing:10){
            
            Button {
                
            } label: {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(.gray.opacity(0.5))
                    .frame(width: 344,height: 280)
                    .overlay {
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100,height: 100)
                            .foregroundStyle(.gray)
                            
                        
                            
                            
                    }
                
            }
            .padding(.top)
            Spacer()
            
            Form{
                Section(header: Text("")){
                    Picker("Type Product",selection: $mainCategory){
                        ForEach(typeProduct,id: \.self){
                           Text($0).tag($0)
                        }
                    }
                    
                }
                
                if mainCategory == "Handicrafts"{
                    Picker("", selection: $supCategory) {
                        ForEach(typeProduct,id: \.self){ option in
                            Text(option).tag(option)
                        }
                    }
                }
            }

        }
        .onAppear{
            animations = true
        }
    }
}

#Preview {
    AddProductView()
}
