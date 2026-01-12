//
//  ProductViewModel.swift
//  HomeMade
//
//  Created by user1 on 23/07/1447 AH.
//

import Foundation
import Supabase
import Combine
// عشان نضمن تحديث واجه المستخدم بشكل سلس نستخدم
@MainActor
class ProductViewModel : ObservableObject{
    @Published var isloading = false // اضافه علامه التحميل
    
    // الفنكشن الي ترفع المنتج
    func uploadProduct(name : String,description : String, price: Double)async{
        
        // نتجهز المنتج بناء على المتغيرات الي انشئناهم
        let newProduct = Product(
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
    
}
