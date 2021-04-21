//
//  Details.swift
//  ShineGlass
//
//  Created by dhruv dhola on 08/11/20.
//  Copyright © 2020 Tecocraft. All rights reserved.
//

import Foundation

class Details: Codable {
    
    enum CodingKeys: String, CodingKey {
        case sqft = "sqft"
        case sqft_rate = "sqft_rate"
        case sqft_amount = "sqft_amount"
        case rft_rate = "rft_rate"
        case rft_amount = "rft_amount"
        case work_rate = "work_rate"
        case work_amount = "work_amount"
        case _id = "_id"
        case height = "height"
        case width = "width"
        case rft = "rft"
    }
    
    
    var sqft : Int?
    var sqft_rate : Int?
    var sqft_amount : Int?
    var rft_rate : Int?
    var rft_amount : Int?
    var work_rate : Int?
    var work_amount : Int?
    var _id : String?
    var height : Int?
    var width : Int?
    var rft : Int?
    
    init (
    sqft : Int?,
    sqft_rate : Int?,
    sqft_amount : Int?,
    rft_rate : Int?,
    rft_amount : Int?,
    work_rate : Int?,
    work_amount : Int?,
    _id : String?,
    height : Int?,
    width : Int?,
    rft : Int?
    ) {
        self.sqft = sqft
        self.sqft_rate = sqft_rate
        self.sqft_amount = sqft_amount
        self.rft_rate = rft_rate
        self.rft_amount = rft_amount
        self.work_rate = work_rate
        self.work_amount = work_amount
        self._id = _id
        self.height = height
        self.width = width
        self.rft = rft
    }
    
    required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        sqft = try container.decodeIfPresent(Int.self, forKey: .sqft)
        sqft_rate = try container.decodeIfPresent(Int.self,forKey: .sqft_rate)
        sqft_amount = try container.decodeIfPresent(Int.self,forKey: .sqft_amount)
        rft_rate = try container.decodeIfPresent(Int.self,forKey: .rft_rate)
        rft_amount = try container.decodeIfPresent(Int.self, forKey: .rft_amount)
        work_rate = try container.decodeIfPresent(Int.self,forKey: .work_rate)
        work_amount = try container.decodeIfPresent(Int.self,forKey: .work_amount)
        _id = try container.decodeIfPresent(String.self,forKey: ._id)
        height = try container.decodeIfPresent(Int.self,forKey: .height)
        width = try container.decodeIfPresent(Int.self,forKey: .width)
        rft = try container.decodeIfPresent(Int.self,forKey: .rft)
       
    }
    
    //#MARK:- Covert to Dictionary
    func dictionaryRepresentation() -> [String: Any] {
        
        var dictionary: [String: Any] = [:]
        if let value = sqft { dictionary[CodingKeys.sqft.rawValue] = value }
        if let value = sqft_rate { dictionary[CodingKeys.sqft_rate.rawValue] = value }
        if let value = sqft_amount { dictionary[CodingKeys.sqft_amount.rawValue] = value }
        if let value = rft { dictionary[CodingKeys.rft.rawValue] = value }
        if let value = rft_rate { dictionary[CodingKeys.rft_rate.rawValue] = value }
        if let value = rft_amount { dictionary[CodingKeys.rft_amount.rawValue] = value }
        if let value = work_amount { dictionary[CodingKeys.work_amount.rawValue] = value }
        if let value = work_rate { dictionary[CodingKeys.work_rate.rawValue] = value }
        if let value = _id { dictionary[CodingKeys._id.rawValue] = value }
        if let value = height { dictionary[CodingKeys.height.rawValue] = value }
        if let value = width { dictionary[CodingKeys.width.rawValue] = value }
        return dictionary
    }
}
