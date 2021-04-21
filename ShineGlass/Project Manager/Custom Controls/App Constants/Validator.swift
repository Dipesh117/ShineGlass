//
//  Validator.swift
//  Shine Glass
//
//  Created by Lucifer on 09/04/20.
//  Copyright © 2020 Tecocraft. All rights reserved.
//

import UIKit
import Foundation

class Validator: NSObject {
    
    class var sharedInstance :Validator {
        struct Singleton {
            static let instance = Validator()
        }
        return Singleton.instance
    }
    
    func isValidEmpty(text: String) -> Bool{
        let data = text.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        if data.isEmpty || data.count == 0 {
            return false
        }
        return true
    }
    
    func isValidPassword(text: String) -> Bool{
        let passwordRegEx = "^.*(?=.{8,})(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[\\d\\X]).*$"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        return passwordTest.evaluate(with: text)
    }
    
    func isPasswordMatched(text: String, passTxt: String) -> Bool {
        if text == passTxt {
            return true
        }else {
            return false
        }
    }
    
    func isValidEmail(text: String) -> Bool {
        
        let emailRegEx = "^([A-Za-z0-9._%+-\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: text)
    }
    
    func isValidPostCode(text: String) -> Bool {

        let postcodeRegEx = "^([A-Za-z][A-Ha-hJ-Yj-y]?[0-9][A-Za-z0-9]?[0-9][A-Za-z]{2}|[Gg][Ii][Rr] 0[Aa]{2})$"
        let postcodeTest = NSPredicate(format:"SELF MATCHES %@", postcodeRegEx)
        return postcodeTest.evaluate(with: text.removeWhitespace())
    }
    
    func isValidFirstName(text: String) -> Bool {
        
        if text.count < 2 || text.count > 50{
            return false
        }
        
        let firstnameRegEx = "^[\\p{L} .'-]+$"
        let firstnameTest = NSPredicate(format:"SELF MATCHES %@", firstnameRegEx)
        return firstnameTest.evaluate(with: text)
    }
    
    func isValidSurName(text: String) -> Bool {
        
        if text.count < 2 || text.count > 50{
            return false
        }
        let sirnameRegEx = "^[\\p{L} .'-]+$"
        let sirnameTest = NSPredicate(format:"SELF MATCHES %@", sirnameRegEx)
        return sirnameTest.evaluate(with: text)
    }
    
    func isValidUserName(text: String) -> Bool {
        if text.count < 5 || text.count > 40{
            return false
        }
        return true
    }
    
    func isValidCity(text: String) -> Bool {
        let data = text.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        if data.count > 0 {
            return true
        }else {
            return false
        }
    }

    func isValidAddress(text: String) -> Bool {
        let data = text.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        if data.count > 0 {
            return true
        }else {
            return false
        }
    }
    
    func isValidCounty(text: String) -> Bool {
        let data = text.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        if data.count > 0 {
            return true
        }else {
            return false
        }
    }
    
    func isValidCountry(text: String) -> Bool {
        let data = text.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        if data.count > 0 {
            return true
        }else {
            return false
        }
    }
    
    func isValidcontactNo(text: String) -> Bool {
        
        let contactNoRegEx = "[0-9]{10,11}$"
        let contactNoTest = NSPredicate(format:"SELF MATCHES %@", contactNoRegEx)
        return contactNoTest.evaluate(with: text)

    }
    
    func isValidBirthdate(text: String) -> Bool {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"
        let someDate = text
        if dateFormatterGet.date(from: someDate) != nil {
            return true
        } else {
            return false
        }
    }
    
    func isValidAffiliateCode(text: String) -> Bool {
        if text.count >= 0 && text.count <= 32 {
            return true
        } else {
            return false
        }
    }
}
