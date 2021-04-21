//
//  StringExtension.swift
//  Highclere
//
//  Created by Lucifer on 09/04/20.
//  Copyright © 2020 Tecocraft. All rights reserved.
//

import Foundation

extension String {

    func replace(string:String, replacement:String) -> String {
        return self.replacingOccurrences(of: string, with: replacement, options: NSString.CompareOptions.literal, range: nil)
    }
    
    func removeWhitespace() -> String {
        return self.replace(string: " ", replacement: "")
    }
    
    func convertDate(toFormat:String = "d MMM", fromFormat:String = "yyyy-MM-dd")-> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale(identifier: NSLocale.current.identifier)
        dateFormatter.dateFormat = fromFormat
        
        var serverDate: Date = Date()
        if let date: Date = dateFormatter.date(from: self) {
            serverDate = date
        }
        
        dateFormatter.dateFormat = toFormat
        let date = dateFormatter.string(from: serverDate)
        return date
    }
    
    
    func toDate(format: String) -> Date {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.timeZone = TimeZone.current
        
        dateFormatter.locale = Locale(identifier: NSLocale.current.identifier)
        
        dateFormatter.dateFormat = format
        
        var serverDate: Date = Date()
        if let date: Date = dateFormatter.date(from: self) {
            serverDate = date
        }
        return serverDate
        
    }
    
    var htmlToAttributedString: NSMutableAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            
            return try NSMutableAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
            
        } catch {
            
            return nil
            
        }
        
    }
       
    var htmlToString: String {
    
        return htmlToAttributedString?.string ?? ""
    }
    
    func manageRank(value: Int) -> String {
        
        var suffix: String
        let ones: Int = value % 10
        let tens: Int = (value/10) % 10
        
        if tens == 1 {
            suffix = "th"
        }
        else if ones == 1 {
            suffix = "st"
        }
        else if ones == 2 {
            suffix = "nd"
        }
        else if ones == 3 {
            suffix = "rd"
        }
        else {
            suffix = "th"
        }
        
        return "\(suffix)"
    }
}

extension Encodable {
    
    func convertJson() -> String {
        
        let encoder = JSONEncoder()
        
        if let jsonData = try? encoder.encode(self) {
            
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                
                return jsonString
            }
            else {
                
                return ""
            }
        }
        else {
            
            return ""
        }
    }
}

