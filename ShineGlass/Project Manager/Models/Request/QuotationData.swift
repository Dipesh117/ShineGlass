//
//  QuotationData.swift
//  ShineGlass
//
//  Created by dhruv dhola on 08/11/20.
//  Copyright © 2020 Tecocraft. All rights reserved.
//



import Foundation
class QuotationData: Codable {
    
    enum CodingKeys: String, CodingKey {
        case _id
        case category
        case subcategory
        case scale
        case thickness
        case width
        case height
        case quantity
        
        
    }
    
    var _id: String?
    var category: String?
    var subcategory: String?
    var scale: String?
    var thickness: Int?
    var width: Int?
    var height: Int?
    var quantity: Int?
    
    
    
   
    
    init (
    _id: String?,
    category: String?,
    subcategory: String?,
    scale: String?,
    thickness: Int?,
    width: Int?,
    height: Int?,
    quantity: Int?) {
        
        self._id = _id
        self.category = category
        self.subcategory = subcategory
        self.scale = scale
        self.thickness = thickness
        self.width = width
        self.height = height
        self.quantity = quantity
    }
    
    required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        _id = try container.decodeIfPresent(String.self, forKey: ._id)
        category = try container.decodeIfPresent(String.self,forKey: .category)
        subcategory = try container.decodeIfPresent(String.self,forKey: .subcategory)
        scale = try container.decodeIfPresent(String.self, forKey: .scale)
        thickness = try container.decodeIfPresent(Int.self,forKey: .thickness)
        width = try container.decodeIfPresent(Int.self,forKey: .width)
        height = try container.decodeIfPresent(Int.self, forKey: .height)
        quantity = try container.decodeIfPresent(Int.self,forKey: .quantity)
    }
    
    //#MARK:- Covert to Dictionary
    func dictionaryRepresentation() -> [String: Any] {
        
        var dictionary: [String: Any] = [:]
        if let value = _id { dictionary[CodingKeys._id.rawValue] = value }
        if let value = category { dictionary[CodingKeys.category.rawValue] = value }
        if let value = subcategory { dictionary[CodingKeys.subcategory.rawValue] = value }
        if let value = scale { dictionary[CodingKeys.scale.rawValue] = value }
        if let value = thickness { dictionary[CodingKeys.thickness.rawValue] = value }
        if let value = width { dictionary[CodingKeys.width.rawValue] = value }
        if let value = height { dictionary[CodingKeys.height.rawValue] = value }
        if let value = quantity { dictionary[CodingKeys.quantity.rawValue] = value }

        return dictionary
    }
}
