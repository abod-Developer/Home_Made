//
//  UserProfile.swift
//  HomeMade
//
//  Created by user1 on 24/07/1447 AH.
//

import Foundation

struct UserProfile : Codable{
    let id : UUID
    let email : String
    let role : UserRole
}
