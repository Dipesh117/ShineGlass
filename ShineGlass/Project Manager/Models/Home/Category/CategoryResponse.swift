//
//  CategoryResponse.swift
//
//  Created by Lucifer on 02/11/20
//  Copyright (c) . All rights reserved.
//

import Foundation

class CategoryResponse: Codable {
    
    enum CodingKeys: String, CodingKey {
        case v = "__v"
        case id = "_id"
        case subcategory = "subcategory"
        case name = "name"
    }
    
    var v: Int?
    var id: String?
    var subcategory: [SubcategoryResponse]?
    var name: String?
    
    init (v: Int?, id: String?, subcategory: [SubcategoryResponse]?, name: String?) {
        self.v = v
        self.id = id
        self.subcategory = subcategory
        self.name = name
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        v = try container.decodeIfPresent(Int.self, forKey: .v)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        subcategory = try container.decodeIfPresent([SubcategoryResponse].self, forKey: .subcategory)
        name = try container.decodeIfPresent(String.self, forKey: .name)
    }
    
    //#MARK:- Covert to Dictionary
    func dictionaryRepresentation() -> [String: Any] {
        
        var dictionary: [String: Any] = [:]
        if let value = v { dictionary[CodingKeys.v.rawValue] = value }
        if let value = id { dictionary[CodingKeys.id.rawValue] = value }
        if let value = subcategory { dictionary[CodingKeys.subcategory.rawValue] = value.map { $0.dictionaryRepresentation() } }
        if let value = name { dictionary[CodingKeys.name.rawValue] = value }
        return dictionary
    }
}
