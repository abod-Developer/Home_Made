import Foundation

struct Product : Codable , Identifiable{
    var id : Int?
    var name : String
    var description : String
    var price : Double
    var image_url : String?
    var seller_id : UUID?
}
