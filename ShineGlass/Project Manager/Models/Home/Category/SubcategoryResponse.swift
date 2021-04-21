//
//  SubcategoryResponse.swift
//
//  Created by Lucifer on 02/11/20
//  Copyright (c) . All rights reserved.
//

import Foundation

class SubcategoryResponse: Codable {
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case id = "_id"
    }
    
    var name: String?
    var id: String?
    
    init (name: String?, id: String?) {
        self.name = name
        self.id = id
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        id = try container.decodeIfPresent(String.self, forKey: .id)
    }
    
    func dictionaryRepresentation() -> [String: Any] {
        
        var dictionary: [String: Any] = [:]
        if let value = name { dictionary[CodingKeys.name.rawValue] = value }
        if let value = id { dictionary[CodingKeys.id.rawValue] = value }
        return dictionary
    }
}
