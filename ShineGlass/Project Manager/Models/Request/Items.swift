//
//  Items.swift
//  ShineGlass
//
//  Created by dhruv dhola on 08/11/20.
//  Copyright © 2020 Tecocraft. All rights reserved.
//

import Foundation

class Items: Codable {
    
    enum CodingKeys: String, CodingKey {
        case type = "type"
        case rate = "rate"
        case quantity = "quantity"
        case total = "total"
    }
    
    
    var type:String?
    var rate:String?
    var quantity:String?
    var total:String?
    
    init (
    type:String?,
    rate:String?,
    quantity:String?,
    total:String?) {
        
        self.type = type
        self.rate = rate
        self.quantity = quantity
        self.total = total
    }
    
    required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decodeIfPresent(String.self, forKey: .type)
        rate = try container.decodeIfPresent(String.self,forKey: .rate)
        quantity = try container.decodeIfPresent(String.self,forKey: .quantity)
        total = try container.decodeIfPresent(String.self,forKey: .total)
       
    }
    
    //#MARK:- Covert to Dictionary
    func dictionaryRepresentation() -> [String: Any] {
        
        var dictionary: [String: Any] = [:]
        if let value = type { dictionary[CodingKeys.type.rawValue] = value }
        if let value = rate { dictionary[CodingKeys.rate.rawValue] = value }
        if let value = quantity { dictionary[CodingKeys.quantity.rawValue] = value }
        if let value = total { dictionary[CodingKeys.total.rawValue] = value }
        
        return dictionary
    }
}
