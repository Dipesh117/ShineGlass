//
//  CustomerData.swift
//  ShineGlass
//
//  Created by dhruv dhola on 08/11/20.
//  Copyright © 2020 Tecocraft. All rights reserved.
//

import Foundation
class CustomerData: Codable {

    enum CodingKeys: String, CodingKey {
        
        case mobile = "mobile"
        case wallet = "wallet"
        case qoutations = "qoutations"
        case orders = "orders"
        case userType = "userType"
        case _id = "_id"
        case email = "email"
        case username = "username"
        case password = "password"
        case Address = "Address"
        case wallet_transaction = "wallet_transaction"
        case date = "date"
        case __v = "__v"
        
        
    }
    
    var mobile : Int?
    var wallet : String?
    var qoutations : [String]?
    var orders : String?
    var userType : String?
    var _id : String?
    var email : String?
    var username : String?
    var password : String?
    var Address : String?
    var wallet_transaction : String?
    var date : String?
    var __v : Int?
    
    
    
    
    init (
    mobile : Int?,
    wallet : String?,
    qoutations : [String]?,
    orders : String?,
    userType : String?,
    _id : String?,
    email : String?,
    username : String?,
    password : String?,
    Address : String?,
    wallet_transaction : String?,
    date : String?,
    __v : Int?) {
        
        
        self.mobile = mobile
        self.wallet = wallet
        self.qoutations = qoutations
        self.orders = orders
        self.userType = userType
        self._id = _id
        self.email = email
        self.username = username
        self.password = password
        self.Address = Address
        self.wallet_transaction = wallet_transaction
        self.date = date
        self.__v = __v
        
        
        
    }
    
    required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        mobile = try container.decodeIfPresent(Int.self, forKey: .mobile)
        wallet = try container.decodeIfPresent(String.self,forKey: .wallet)
        qoutations = try container.decodeIfPresent([String].self,forKey: .qoutations)
        orders = try container.decodeIfPresent(String.self,forKey: .orders)
        userType = try container.decodeIfPresent(String.self, forKey: .userType)
        _id = try container.decodeIfPresent(String.self,forKey: ._id)
        email = try container.decodeIfPresent(String.self,forKey: .email)
        username = try container.decodeIfPresent(String.self,forKey: .username)
        password = try container.decodeIfPresent(String.self,forKey: .password)
        Address = try container.decodeIfPresent(String.self,forKey: .Address)
        wallet_transaction = try container.decodeIfPresent(String.self,forKey: .wallet_transaction)
        date = try container.decodeIfPresent(String.self,forKey: .date)
        __v = try container.decodeIfPresent(Int.self,forKey: .__v)
       
    }
    
    //#MARK:- Covert to Dictionary
    func dictionaryRepresentation() -> [String: Any] {
        
        var dictionary: [String: Any] = [:]
        if let value = mobile { dictionary[CodingKeys.mobile.rawValue] = value }
        if let value = wallet { dictionary[CodingKeys.wallet.rawValue] = value }
        if let value = qoutations { dictionary[CodingKeys.qoutations.rawValue] = value }
        if let value = orders { dictionary[CodingKeys.orders.rawValue] = value }
        if let value = userType { dictionary[CodingKeys.userType.rawValue] = value }
        if let value = username { dictionary[CodingKeys.username.rawValue] = value }
        if let value = password { dictionary[CodingKeys.password.rawValue] = value }
        if let value = Address { dictionary[CodingKeys.Address.rawValue] = value }
        if let value = wallet_transaction { dictionary[CodingKeys.wallet_transaction.rawValue] = value }
        if let value = date { dictionary[CodingKeys.date.rawValue] = value }
        if let value = __v { dictionary[CodingKeys.__v.rawValue] = value }
        return dictionary
    }
}
