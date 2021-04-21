//
//  Files.swift
//  ShineGlass
//
//  Created by dhruv dhola on 08/11/20.
//  Copyright © 2020 Tecocraft. All rights reserved.
//

import Foundation
class Files: Codable {
    
    enum CodingKeys: String, CodingKey {
        case _id = "_id"
        case url = "url"
        case filetype = "filetype"
    }
    
    
    var _id:String?
    var url:String?
    var filetype:String?
    
    init (
    _id:String?,
    url:String?,
    filetype:String?) {
        
        self._id = _id
        self.url = url
        self.filetype = filetype
       
    }
    
    required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        _id = try container.decodeIfPresent(String.self, forKey: ._id)
        url = try container.decodeIfPresent(String.self,forKey: .url)
        filetype = try container.decodeIfPresent(String.self,forKey: .filetype)
        
       
    }
    
    //#MARK:- Covert to Dictionary
    func dictionaryRepresentation() -> [String: Any] {
        
        var dictionary: [String: Any] = [:]
        if let value = _id { dictionary[CodingKeys._id.rawValue] = value }
        if let value = url { dictionary[CodingKeys.url.rawValue] = value }
        if let value = filetype { dictionary[CodingKeys.filetype.rawValue] = value }
        
        return dictionary
    }
}
