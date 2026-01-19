//
//  ImagePickerHandler.swift
//  HomeMade
//
//  Created by user1 on 26/07/1447 AH.
//

import Foundation
import SwiftUI
import PhotosUI
internal import UIKit
import Combine
class ImagePickerHandler : ObservableObject{
   
    // الغرض المختار من الاستديو
    @Published var imageSelectio  : PhotosPickerItem? = nil{
        didSet{
            // هنا بمجرد ما يختار المستخدم يتم تحويله مباشره
            if let imageSelectio {
                Task{
                     await loadUIImage(from: imageSelectio)
                }
            }
        }
    }
    @Published var selectedImage : UIImage? = nil
    
    private func loadUIImage(from selection : PhotosPickerItem)async{
        
        do{
            // نطلب البيانات بصيغة Data
            if let data = try? await selection.loadTransferable(type: Data.self){
                //نحول البيانات الى صوره
                if let uiImage = UIImage(data: data){
                    //نحدث الواجهه الرئيسية 
                    await MainActor.run {
                        self.selectedImage = uiImage
                    }
                    
                }
            }
        } catch{
            print("فشل التحميل: \(error.localizedDescription)")
            }
//            DispatchQueue.main.async {
//                switch result{
//                case .success(let data):
//                    if let data = data, let uiImage = UIImage(data: data){
//                        self.selectedImage = uiImage
//                    }
//                case .failure(let error):
//                    print("DownLoding Image Filed\(error.localizedDescription)")
//                }
//            }
            
        }
    }
    

