//
//  UserDefaultConstant.swift
//  ShineGlass
//
//  Created by Lucifer on 20/10/20.
//  Copyright © 2020 Tecocraft. All rights reserved.
//

import Foundation

class UserDefaultConstant: NSObject {
    
    class var sharedInstance :UserDefaultConstant {
        
        struct Singleton {
            static let instance = UserDefaultConstant()
        }
        return Singleton.instance
    }
    
    
    func setupValue(Key:String, Value: Any) {
        
        UserDefaults.standard.set(Value, forKey: Key)
        
        UserDefaults.standard.synchronize()
        
    }
    
    
    func removeValue(Key:String){
        
        UserDefaults.standard.removeObject(forKey: Key)
        
        UserDefaults.standard.synchronize()
        
    }
    
    enum authKeys: String {
        
        case userAuthToken = "userAuthToken"
        case userData = "userData"
        case allUserData = "allUserData"
        
        var instance : Any? {
            
            return UserDefaults.standard.value(forKey: self.rawValue) ?? nil
        }
    }
}

//#MARK:- Getter Setter
var authToken: String {
    
    if let token = UserDefaultConstant.authKeys.userAuthToken.instance as? String {
        
        return token
    }
    else {
        
        return ""
    }
}

var userData: LoginData? {
    
    let decoder = JSONDecoder()
    
    decoder.keyDecodingStrategy = .useDefaultKeys
    
    if let json = UserDefaultConstant.authKeys.userData.instance as? String {
        
        do {
            
            let loginResponse = try decoder.decode(LoginData.self, from: Data(json.utf8))
            
            return loginResponse
        }
        catch {
            
            return nil
        }
    }
    else {
        
        return nil
    }
}
