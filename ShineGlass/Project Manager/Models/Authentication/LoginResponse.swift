//
//  LoginResponse.swift
//
//  Created by Lucifer on 19/10/20
//  Copyright (c) . All rights reserved.
//

import Foundation

class LoginResponse: Codable {
    
    enum CodingKeys: String, CodingKey {
        
        case message = "message"
        case type = "type"
        case token = "token"
        case otp = "otp"
        case user = "user"
    }
    
    var message: String?
    var type: String?
    var token: String?
    var otp: String?
    var user: LoginData?
    
    init (message: String?, type: String?, token: String?, user: LoginData?, otp: String?) {
        
        self.message = message
        self.type = type
        self.token = token
        self.otp = otp
        self.user = user
    }
    
    required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        message = try container.decodeIfPresent(String.self, forKey: .message)
        type = try container.decodeIfPresent(String.self, forKey: .type)
        token = try container.decodeIfPresent(String.self, forKey: .token)
        otp = try container.decodeIfPresent(String.self, forKey: .otp)
        user = try container.decodeIfPresent(LoginData.self, forKey: .user)
    }
    
    //#MARK:- Covert to Dictionary
    func dictionaryRepresentation() -> [String: Any] {
        
        var dictionary: [String: Any] = [:]
        if let value = message { dictionary[CodingKeys.message.rawValue] = value }
        if let value = type { dictionary[CodingKeys.type.rawValue] = value }
        if let value = token { dictionary[CodingKeys.token.rawValue] = value }
        if let value = otp { dictionary[CodingKeys.otp.rawValue] = value }
        if let value = user { dictionary[CodingKeys.user.rawValue] = value.dictionaryRepresentation() }
        return dictionary
    }
}
