//
//  MyRequestResponse.swift
//  ShineGlass
//
//  Created by dhruv dhola on 08/11/20.
//  Copyright © 2020 Tecocraft. All rights reserved.
//

import Foundation


class MyRequestResponse: Codable {
    
    enum CodingKeys: String, CodingKey {
        case accept = "accept"
        case valuation = "valuation"
        case items = "items"
        case totalsqft = "totalsqft"
        case subtotal1 = "subtotal1"
        case delivery_rate = "delivery_rate"
        case delivery_amount = "delivery_amount"
        case discount = "discount"
        case subtotal2 = "subtotal2"
        case GST = "GST"
        case Vehicle_trasportation = "Vehicle_trasportation"
        case GST_Trasnportation = "GST_Trasnportation"
        case total = "total"
        case reject = "reject"
        case _id = "_id"
        case customer = "customer"
        case QuotationNo = "QuotationNo"
        case quotation = "quotation"
        case status = "status"
        case files = "files"
        case city = "city"
        case date = "date"
        case details = "details"
        case __v = "__v"
    }
    
    
    var accept: Bool?
    var valuation: Bool?
    var items: [Items]?
    var totalsqft: Int?
    var subtotal1: Int?
    var delivery_rate: Int?
    var delivery_amount: Int?
    var discount: Int?
    var subtotal2: Int?
    var GST: Int?
    var Vehicle_trasportation: Int?
    var GST_Trasnportation: Int?
    var total: Int?
    var reject: Bool?
    var _id: String?
    var customer: CustomerData?
    var QuotationNo: String?
    var quotation: [QuotationData]?
    var status: String?
    var files: [Files]?
    var city: String?
    var date: String?
    var details : [Details]?
    var __v: Int?
    
    
    init (
    accept: Bool?,
    valuation: Bool?,
    items: [Items]?,
    totalsqft: Int?,
    subtotal1: Int?,
    delivery_rate: Int?,
    delivery_amount: Int?,
    discount: Int?,
    subtotal2: Int?,
    GST: Int?,
    Vehicle_trasportation: Int?,
    GST_Trasnportation: Int?,
    total: Int?,
    reject: Bool?,
    _id: String?,
    customer: CustomerData?,
    QuotationNo: String?,
    quotation: [QuotationData]?,
    status: String?,
    files: [Files]?,
    city: String?,
    date: String?,
    details : [Details]?,
    __v: Int?) {
        
        self.accept = accept
        self.valuation = valuation
        self.items = items
        self.totalsqft = totalsqft
        self.subtotal1 = subtotal1
        self.delivery_rate = delivery_rate
        self.delivery_amount = delivery_amount
        self.discount = discount
        self.subtotal2 = subtotal2
        self.GST = GST
        self.Vehicle_trasportation = Vehicle_trasportation
        self.GST_Trasnportation = GST_Trasnportation
        self.total = total
        self.reject = reject
        self._id = _id
        self.customer = customer
        self.QuotationNo = QuotationNo
        self.quotation = quotation
        self.status = status
        self.files = files
        self.city = city
        self.date = date
        self.details = details
        self.__v = __v
    }
    
    required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        accept = try container.decodeIfPresent(Bool.self, forKey: .accept)
        valuation = try container.decodeIfPresent(Bool.self,forKey: .valuation)
        items = try container.decodeIfPresent([Items].self,forKey: .items)
        totalsqft = try container.decodeIfPresent(Int.self,forKey: .totalsqft)
        subtotal1 = try container.decodeIfPresent(Int.self,forKey: .subtotal1)
        delivery_rate = try container.decodeIfPresent(Int.self,forKey: .delivery_rate)
        delivery_amount = try container.decodeIfPresent(Int.self,forKey: .delivery_amount)
        discount = try container.decodeIfPresent(Int.self,forKey: .discount)
        subtotal2 = try container.decodeIfPresent(Int.self,forKey: .subtotal2)
        GST = try container.decodeIfPresent(Int.self,forKey: .GST)
        Vehicle_trasportation = try container.decodeIfPresent(Int.self,forKey: .Vehicle_trasportation)
        GST_Trasnportation = try container.decodeIfPresent(Int.self,forKey: .GST_Trasnportation)
        total = try container.decodeIfPresent(Int.self,forKey: .total)
        reject = try container.decodeIfPresent(Bool.self,forKey: .reject)
        _id = try container.decodeIfPresent(String.self,forKey: ._id)
        customer = try container.decodeIfPresent(CustomerData.self,forKey: .customer)
        QuotationNo = try container.decodeIfPresent(String.self,forKey: .QuotationNo)
        quotation = try container.decodeIfPresent([QuotationData]
            .self,forKey: .quotation)
        status = try container.decodeIfPresent(String.self,forKey: .status)
        files = try container.decodeIfPresent([Files].self,forKey: .files)
        city = try container.decodeIfPresent(String.self,forKey: .city)
        date = try container.decodeIfPresent(String.self,forKey: .date)
        details = try container.decodeIfPresent([Details].self,forKey: .details)
        __v = try container.decodeIfPresent(Int.self,forKey: .__v)
    }
    
    //#MARK:- Covert to Dictionary
    func dictionaryRepresentation() -> [String: Any] {
        
        var dictionary: [String: Any] = [:]
        if let value = accept { dictionary[CodingKeys.accept.rawValue] = value }
        if let value = valuation { dictionary[CodingKeys.valuation.rawValue] = value }
        if let value = items {
            for i in value {
                dictionary[CodingKeys.items.rawValue] = i.dictionaryRepresentation()
            }}
        if let value = totalsqft { dictionary[CodingKeys.totalsqft.rawValue] = value }
        if let value = subtotal1 { dictionary[CodingKeys.subtotal1.rawValue] = value }
        if let value = delivery_rate { dictionary[CodingKeys.delivery_rate.rawValue] = value }
        if let value = delivery_amount { dictionary[CodingKeys.delivery_amount.rawValue] = value }
        if let value = date { dictionary[CodingKeys.date.rawValue] = value }
        if let value = discount { dictionary[CodingKeys.discount.rawValue] = value }
        if let value = subtotal2 { dictionary[CodingKeys.subtotal2.rawValue] = value }
        if let value = GST { dictionary[CodingKeys.GST.rawValue] = value }
        if let value = GST_Trasnportation { dictionary[CodingKeys.GST_Trasnportation.rawValue] = value }
        if let value = __v { dictionary[CodingKeys.__v.rawValue] = value }
        if let value = Vehicle_trasportation { dictionary[CodingKeys.Vehicle_trasportation.rawValue] = value }
        if let value = total { dictionary[CodingKeys.total.rawValue] = value }
        if let value = reject { dictionary[CodingKeys.reject.rawValue] = value }
        if let value = _id { dictionary[CodingKeys._id.rawValue] = value }
        if let value = customer {dictionary[CodingKeys.customer.rawValue] = value}
        if let value = QuotationNo { dictionary[CodingKeys.QuotationNo.rawValue] = value }
        if let value = quotation { dictionary[CodingKeys.quotation.rawValue] = value }
        if let value = status { dictionary[CodingKeys.status.rawValue] = value }
        if let value = files { dictionary[CodingKeys.files.rawValue] = value }
        if let value = city { dictionary[CodingKeys.city.rawValue] = value }
        
        if let value = details {
            for i in value {
                dictionary[CodingKeys.details.rawValue] = i.dictionaryRepresentation()
            }}

        return dictionary
    }
}
