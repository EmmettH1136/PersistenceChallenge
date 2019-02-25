//
//  Contact.swift
//  PersistenceChallenge
//
//  Created by Bobb Darnell on 5/2/18.
//  Copyright © 2018 MobileMakersEdu. All rights reserved.
//

import Foundation

class Contact : Codable {
    var name : String
    var age : Int
    var phone: String
    
    init(_ name : String, _ age : Int, _ phone: String) {
        self.name = name
        self.age = age
        self.phone = phone
    }
    enum CodingKeys: String, CodingKey {
        case name
        case age
        case phone
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        age = try container.decode(Int.self, forKey: .age)
        phone = try container.decode(String.self, forKey: .phone)
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(age, forKey: .age)
        try container.encode(phone, forKey: .phone)
    }
}

