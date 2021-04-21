//
//  RateResponse.swift
//
//  Created by Lucifer on 02/11/20
//  Copyright (c) . All rights reserved.
//

import Foundation

class RateResponse: Codable {
    
    enum CodingKeys: String, CodingKey {
        case createdAt = "createdAt"
        case v = "__v"
        case id = "_id"
        case updatedAt = "updatedAt"
        case rate = "rate"
        case name = "name"
    }
    
    var createdAt: String?
    var v: Int?
    var id: String?
    var updatedAt: String?
    var rate: String?
    var name: String?
    
    init (createdAt: String?, v: Int?, id: String?, updatedAt: String?, rate: String?, name: String?) {
        self.createdAt = createdAt
        self.v = v
        self.id = id
        self.updatedAt = updatedAt
        self.rate = rate
        self.name = name
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt)
        v = try container.decodeIfPresent(Int.self, forKey: .v)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        updatedAt = try container.decodeIfPresent(String.self, forKey: .updatedAt)
        rate = try container.decodeIfPresent(String.self, forKey: .rate)
        name = try container.decodeIfPresent(String.self, forKey: .name)
    }
    
    func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        if let value = createdAt { dictionary[CodingKeys.createdAt.rawValue] = value }
        if let value = v { dictionary[CodingKeys.v.rawValue] = value }
        if let value = id { dictionary[CodingKeys.id.rawValue] = value }
        if let value = updatedAt { dictionary[CodingKeys.updatedAt.rawValue] = value }
        if let value = rate { dictionary[CodingKeys.rate.rawValue] = value }
        if let value = name { dictionary[CodingKeys.name.rawValue] = value }
        return dictionary
    }
}
