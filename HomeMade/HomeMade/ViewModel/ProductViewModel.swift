//
//  ProductViewModel.swift
//  HomeMade
//
//  Created by user1 on 23/07/1447 AH.
//

import Foundation
import Supabase
import Combine
internal import UIKit
// عشان نضمن تحديث واجه المستخدم بشكل سلس نستخدم
@MainActor
class ProductViewModel : ObservableObject{
    //المتغيرات الحله المزتبطه بالوجهة
    @Published var productName : String = ""
    @Published var productPrice: String = ""
    @Published var description: String = ""
    
    
    @Published var isloading = false // اضافه علامه التحميل
    
    // الفنكشن الي ترفع المنتج
    func uploadProduct(name : String,description : String, price: Double)async{
        
        // نتجهز المنتج بناء على المتغيرات الي انشئناهم
        let newProduct = Product(
            id: nil,
            name: name,
            description: description,
            price: price,
            image_url: nil,
            seller_id: nil
        )
        
        do{
            // هنا نكلم قاعدة البيانات ونقوله ادخل الجدول وسوي ادراج لهاذا المنتج (prduct)
            try await SupabaseConfig.client
                .from("product_two")
                .insert(newProduct)
                .execute()
            print("تم اضافة المنتج بنجاح")
            isloading = false
        }catch{
            print("خطأ في االرفع \(error.localizedDescription)")
            isloading = false
        }
    }
    
    func uploadProduct(imageHandler : ImagePickerHandler,seletedType: String, supType: String) async{
        // نتاكد من وجود صوره
        guard let uiImage = imageHandler.selectedImage else { return }
        guard !productName.isEmpty && !productPrice.isEmpty else { return }
        isloading = true// يبدا تحميل
        
        // تحويل الصوره الى بيانات
        guard let imageData = uiImage.jpegData(compressionQuality: 0.5) else { isloading = false; return }
        
        do{
            // نرفع الصور للمخزون
            let fileName = "\(UUID().uuidString).jpg"
            
            try await SupabaseConfig.client.storage.from("product_two")
                .upload(fileName, data: imageData)
            
            // جلب رابط الصوره
            let imageUrl = try SupabaseConfig.client.storage
                .from("product_two")
                .getPublicURL(path: fileName)
            
            // حضّر الموديل بنوعاته الصحيحة
            let priceDouble = Double(productPrice) ?? 0.0
            let newProduct = Product(
                id: nil,
                name: productName,
                description: description,
                price: priceDouble,
                image_url: imageUrl.absoluteString,
                seller_id: SupabaseConfig.client.auth.currentUser?.id
            )
            
            try await SupabaseConfig.client
                .from("product_two")
                .insert(newProduct)
                .execute()
            
            print("تم اضافة المنتج مع الصورة بنجاح")
            isloading = false
        }catch{
            print("خطأ في رفع المنتج/الصورة: \(error.localizedDescription)")
            isloading = false
        }
        
    }
    
}
