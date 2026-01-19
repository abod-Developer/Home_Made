//
//  AddProductView.swift
//  HomeMade
//
//  Created by user1 on 25/07/1447 AH.
//

import SwiftUI
import PhotosUI
internal import UIKit
struct AddProductView: View {
    @State private var mainCategory = "Handicraft"
    @State private var supCategory = ""
    
    
    @State private var mainList = ["Other","Handicrafts","Food","Sweets"]
    @State private var handicraftOptions = ["Sewing","Pottery","Painting"]
    @State private var foodOptions = ["Desserts","Main Dishes","Savory Dishes","Drinks"]
    @State private var animations = false
    @State private var shwoImage = false
    
    
    @StateObject private var imageHandler = ImagePickerHandler()
    @StateObject private var productVM = ProductViewModel()
    var body: some View {
        VStack(spacing:10){
            
            PhotosPicker(selection: $imageHandler.imageSelectio,matching: .images){
                
                
                if let selected = imageHandler.selectedImage{
                    Image(uiImage: selected)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 344, height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                  
                    
                }else{
                    
                        
                            Image(systemName: "photo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100,height: 100)
                                .foregroundStyle(.gray)
                        
                        .padding(.top)
                }
            }
            .padding(.top,40)
            Spacer()
            
            Form{
                Section(header: Text("")){
                    Picker("Type Product",selection: $mainCategory){
                        ForEach(mainList,id: \.self){
                           Text($0).tag($0)
                        }
                    }
                    
                }
                
                if mainCategory == "Handicrafts"{
                    Picker("", selection: $supCategory) {
                        ForEach(handicraftOptions,id: \.self){ option in
                            Text(option).tag(option)
                        }
                    }
                }else if mainCategory == "Food"{
                    Picker("Food", selection: $supCategory) {
                        ForEach(foodOptions,id: \.self){
                            Text($0).tag($0)
                        }
                    }
                }else if mainCategory == "Other"{
                    
                 
                    Section{
                        TextField("Name of Product", text:$productVM.productName)
                            .frame(height: 100)
                    }

                    Section {
                        TextField("Price of Product", text:$productVM.productPrice)
                            .frame(height: 50)
                    }
                }
                
                Section{
                    
                    TextField("Description of Product", text:$productVM.description)
                        .frame(height: 100)
                    
                }
            }

        }
       
    }
}

#Preview {
    AddProductView()
}
