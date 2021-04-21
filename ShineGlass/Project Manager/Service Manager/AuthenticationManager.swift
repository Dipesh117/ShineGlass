//
//  AuthenticationManager.swift
//  ShineGlass
//
//  Created by Lucifer on 19/10/20.
//  Copyright © 2020 Tecocraft. All rights reserved.
//

import Foundation
import PromiseKit
import SwiftyJSON
import AlamofireSwiftyJSON

func header() -> [String : String] {
    return [
        "Accept":"application/json",
        "Content-Type":"application/json",
    ]
}

func authHeader() -> [String : String] {
    return [
        "Accept":"application/json",
        "Content-Type":"application/json",
        "token": authToken
    ]
}

struct AuthenticationManager {

    // Register User
    func registerUserApi(param: [String: String]) -> Promise<LoginResponse> {
        
        let url = sAPIUrl + sRegister
        
        let decoder = JSONDecoder()
        
        decoder.keyDecodingStrategy = .useDefaultKeys
        
        let jsonData1 = try? JSONSerialization.data(withJSONObject: param, options: [])
        
        let jsonString = String(data: jsonData1!, encoding: .utf8)
        
        let jsonData = jsonString?.data(using: .utf8, allowLossyConversion: false)!
        
        var request = URLRequest(url: URL(string: url)!)
        
        request.httpMethod = HTTPMethod.post.rawValue
        
        request.timeoutInterval = 40
        
        request.httpBody = jsonData
        
        request.allHTTPHeaderFields = header()
        
        return Promise() { resolver in
            
            Alamofire.request(request)
                .validate(statusCode: 200..<400)
                .validate(contentType: ["application/json"])
                .responseSwiftyJSON{ (response) in
                    
                    switch(response.result)
                    {
                    case .success(_):
                        
                        if let responseData = response.data {
                            
                            do {
                                
                                let loginResponse = try decoder.decode(LoginResponse.self, from: responseData)
                                
                                resolver.fulfill(loginResponse)
                            }
                            catch (let errorN) {
                                
                                resolver.reject(errorN)
                            }
                        }
                        else {
                            
                            let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey :"An error has occured." as Any])
                            
                            resolver.reject(error)
                        }
                        
                    case .failure(let error):
                        
                        if let responseData = response.data {
                            
                            do {
                                
                                let loginResponse = try decoder.decode(LoginResponse.self, from: responseData)
                                
                                if loginResponse.message != nil {
                                    
                                    let errorMsg = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: loginResponse.message as Any])
                                    
                                    resolver.reject(errorMsg)
                                }
                                
                                resolver.reject(error)
                            }
                            catch {
                                
                                resolver.reject(error)
                            }
                        }
                        
                        resolver.reject(error)
                    }
            }
        }
    }
    
    
    // Login User
    func loginUserApi(param: [String: String]) -> Promise<LoginResponse> {
        
        let url = sAPIUrl + sLogin
        
        let decoder = JSONDecoder()
        
        decoder.keyDecodingStrategy = .useDefaultKeys
        
        let jsonData1 = try? JSONSerialization.data(withJSONObject: param, options: [])
        
        let jsonString = String(data: jsonData1!, encoding: .utf8)
        
        let jsonData = jsonString?.data(using: .utf8, allowLossyConversion: false)!
        
        var request = URLRequest(url: URL(string: url)!)
        
        request.httpMethod = HTTPMethod.post.rawValue
        
        request.timeoutInterval = 40
        
        request.httpBody = jsonData
        
        request.allHTTPHeaderFields = header()
        
        return Promise() { resolver in
            
            Alamofire.request(request)
                .validate(statusCode: 200..<400)
                .validate(contentType: ["application/json"])
                .responseSwiftyJSON{ (response) in
                    
                    switch(response.result)
                    {
                    case .success(_):
                        
                        if let responseData = response.data {
                            
                            do {
                                
                                let loginResponse = try decoder.decode(LoginResponse.self, from: responseData)
                                
                                resolver.fulfill(loginResponse)
                            }
                            catch (let errorN) {
                                
                                resolver.reject(errorN)
                            }
                        }
                        else {
                            
                            let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey :"An error has occured." as Any])
                            
                            resolver.reject(error)
                        }
                        
                    case .failure(let error):
                        
                        if let responseData = response.data {
                            
                            do {
                                
                                let loginResponse = try decoder.decode(LoginResponse.self, from: responseData)
                                
                                if loginResponse.message != nil {
                                    
                                    let errorMsg = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: loginResponse.message as Any])
                                    
                                    resolver.reject(errorMsg)
                                }
                                
                                resolver.reject(error)
                            }
                            catch {
                                
                                resolver.reject(error)
                            }
                        }
                        
                        resolver.reject(error)
                    }
            }
        }
    }
    
    // Login with OTP
    func loginWithOTPUserApi(param: [String: String]) -> Promise<LoginResponse> {
        
        let url = sAPIUrl + sNumberLogin
        
        let decoder = JSONDecoder()
        
        decoder.keyDecodingStrategy = .useDefaultKeys
        
        let jsonData1 = try? JSONSerialization.data(withJSONObject: param, options: [])
        
        let jsonString = String(data: jsonData1!, encoding: .utf8)
        
        let jsonData = jsonString?.data(using: .utf8, allowLossyConversion: false)!
        
        var request = URLRequest(url: URL(string: url)!)
        
        request.httpMethod = HTTPMethod.post.rawValue
        
        request.timeoutInterval = 40
        
        request.httpBody = jsonData
        
        request.allHTTPHeaderFields = header()
        
        return Promise() { resolver in
            
            Alamofire.request(request)
                .validate(statusCode: 200..<400)
                .validate(contentType: ["application/json"])
                .responseSwiftyJSON{ (response) in
                    
                    switch(response.result)
                    {
                    case .success(_):
                        
                        if let responseData = response.data {
                            
                            do {
                                
                                let loginResponse = try decoder.decode(LoginResponse.self, from: responseData)
                                
                                resolver.fulfill(loginResponse)
                            }
                            catch (let errorN) {
                                
                                resolver.reject(errorN)
                            }
                        }
                        else {
                            
                            let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey :"An error has occured." as Any])
                            
                            resolver.reject(error)
                        }
                        
                    case .failure(let error):
                        
                        if let responseData = response.data {
                            
                            do {
                                
                                let loginResponse = try decoder.decode(LoginResponse.self, from: responseData)
                                
                                if loginResponse.message != nil {
                                    
                                    let errorMsg = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: loginResponse.message as Any])
                                    
                                    resolver.reject(errorMsg)
                                }
                                
                                resolver.reject(error)
                            }
                            catch {
                                
                                resolver.reject(error)
                            }
                        }
                        
                        resolver.reject(error)
                    }
            }
        }
    }
    
    func requestApiCall(param: [String: String]) -> Promise<[MyRequestResponse]> {
        
        let url = sAPIUrl + sQuotation
        
        let decoder = JSONDecoder()
        
        decoder.keyDecodingStrategy = .useDefaultKeys
        
        
        var request = URLRequest(url: URL(string: url)!)
        
        request.httpMethod = HTTPMethod.get.rawValue
        
        request.timeoutInterval = 40
        
        request.allHTTPHeaderFields = authHeader()
        
        return Promise() { resolver in
            
            Alamofire.request(request)
                .validate(statusCode: 200..<400)
                .validate(contentType: ["application/json"])
                .responseSwiftyJSON{ (response) in
                    
                    switch(response.result)
                    {
                    case .success(_):
                        
                        if let responseData = response.data {
                            
                            do {
                                
                                let request = try decoder.decode([MyRequestResponse].self, from: responseData)
                                
                                resolver.fulfill(request)
                            }
                            catch (let errorN) {
                                
                                resolver.reject(errorN)
                            }
                        }
                        else {
                            
                            let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey :"An error has occured." as Any])
                            
                            resolver.reject(error)
                        }
                        
                    case .failure(let error):
                        
                        if let responseData = response.data {
                            
                            do {
                                
                                let loginResponse = try decoder.decode(LoginResponse.self, from: responseData)
                                
                                if loginResponse.message != nil {
                                    
                                    let errorMsg = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: loginResponse.message as Any])
                                    
                                    resolver.reject(errorMsg)
                                }
                                
                                resolver.reject(error)
                            }
                            catch {
                                
                                resolver.reject(error)
                            }
                        }
                        
                        resolver.reject(error)
                    }
            }
        }
    }
}
