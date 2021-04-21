//
//  BannerResponse.swift
//
//  Created by Lucifer on 02/11/20
//  Copyright (c) . All rights reserved.
//

import Foundation

class BannerResponse: Codable {
    
    enum CodingKeys: String, CodingKey {
        case url = "url"
        case v = "__v"
        case id = "_id"
        case date = "date"
    }
    
    var url: String?
    var v: Int?
    var id: String?
    var date: String?
    
    init (url: String?, v: Int?, id: String?, date: String?) {
        self.url = url
        self.v = v
        self.id = id
        self.date = date
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        url = try container.decodeIfPresent(String.self, forKey: .url)
        v = try container.decodeIfPresent(Int.self, forKey: .v)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        date = try container.decodeIfPresent(String.self, forKey: .date)
    }
    
    //#MARK:- Covert to Dictionary
    func dictionaryRepresentation() -> [String: Any] {
        
        var dictionary: [String: Any] = [:]
        if let value = url { dictionary[CodingKeys.url.rawValue] = value }
        if let value = v { dictionary[CodingKeys.v.rawValue] = value }
        if let value = id { dictionary[CodingKeys.id.rawValue] = value }
        if let value = date { dictionary[CodingKeys.date.rawValue] = value }
        return dictionary
    }
}
