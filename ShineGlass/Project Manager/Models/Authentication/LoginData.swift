//
//  LoginData.swift
//
//  Created by Lucifer on 19/10/20
//  Copyright (c) . All rights reserved.
//

import Foundation

class LoginData: Codable {
    
    enum CodingKeys: String, CodingKey {
        
        case qoutations = "qoutations"
        case wallet = "wallet"
        case username = "username"
        case id = "_id"
        case orders = "orders"
        case email = "email"
        case password = "password"
        case date = "date"
        case address = "Address"
        case walletTransaction = "wallet_transaction"
        case userType = "userType"
        case mobile = "mobile"
        case v = "__v"
    }
    
    var qoutations: [String]?
    var wallet: Int?
    var username: String?
    var id: String?
    var orders: [String]?
    var email: String?
    var password: String?
    var date: String?
    var address: [String]?
    var walletTransaction: [String]?
    var userType: String?
    var mobile: Int?
    var v: Int?
    
    init (qoutations: [String]?, wallet: Int?, username: String?, id: String?, orders: [String]?, email: String?, password: String?, date: String?, address: [String]?, walletTransaction: [String]?, userType: String?, mobile: Int?, v: Int?) {
        
        self.qoutations = qoutations
        self.wallet = wallet
        self.username = username
        self.id = id
        self.orders = orders
        self.email = email
        self.password = password
        self.date = date
        self.address = address
        self.walletTransaction = walletTransaction
        self.userType = userType
        self.mobile = mobile
        self.v = v
    }
    
    required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        qoutations = try container.decodeIfPresent([String].self, forKey: .qoutations)
        wallet = try container.decodeIfPresent(Int.self, forKey: .wallet)
        username = try container.decodeIfPresent(String.self, forKey: .username)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        orders = try container.decodeIfPresent([String].self, forKey: .orders)
        email = try container.decodeIfPresent(String.self, forKey: .email)
        password = try container.decodeIfPresent(String.self, forKey: .password)
        date = try container.decodeIfPresent(String.self, forKey: .date)
        address = try container.decodeIfPresent([String].self, forKey: .address)
        walletTransaction = try container.decodeIfPresent([String].self, forKey: .walletTransaction)
        userType = try container.decodeIfPresent(String.self, forKey: .userType)
        mobile = try container.decodeIfPresent(Int.self, forKey: .mobile)
        v = try container.decodeIfPresent(Int.self, forKey: .v)
    }
    
    //#MARK:- Covert to Dictionary
    func dictionaryRepresentation() -> [String: Any] {
        
        var dictionary: [String: Any] = [:]
        if let value = qoutations { dictionary[CodingKeys.qoutations.rawValue] = value }
        if let value = wallet { dictionary[CodingKeys.wallet.rawValue] = value }
        if let value = username { dictionary[CodingKeys.username.rawValue] = value }
        if let value = id { dictionary[CodingKeys.id.rawValue] = value }
        if let value = orders { dictionary[CodingKeys.orders.rawValue] = value }
        if let value = email { dictionary[CodingKeys.email.rawValue] = value }
        if let value = password { dictionary[CodingKeys.password.rawValue] = value }
        if let value = date { dictionary[CodingKeys.date.rawValue] = value }
        if let value = address { dictionary[CodingKeys.address.rawValue] = value }
        if let value = walletTransaction { dictionary[CodingKeys.walletTransaction.rawValue] = value }
        if let value = userType { dictionary[CodingKeys.userType.rawValue] = value }
        if let value = mobile { dictionary[CodingKeys.mobile.rawValue] = value }
        if let value = v { dictionary[CodingKeys.v.rawValue] = value }
        return dictionary
    }
}
