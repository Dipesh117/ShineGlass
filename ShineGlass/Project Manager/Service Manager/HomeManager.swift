//
//  HomeManager.swift
//  ShineGlass
//
//  Created by Lucifer on 02/11/20.
//  Copyright © 2020 Tecocraft. All rights reserved.
//

import Foundation
import PromiseKit
import SwiftyJSON
import AlamofireSwiftyJSON

struct HomeManager {

    func getBannerImages() -> Promise<[BannerResponse]> {
        
        let url = sAPIUrl + sBanner
        
        let decoder = JSONDecoder()
        
        decoder.keyDecodingStrategy = .useDefaultKeys
        
        var request = URLRequest(url: URL(string: url)!)
        
        request.httpMethod = HTTPMethod.get.rawValue
        
        request.timeoutInterval = 40
        
        request.httpBody = nil
        
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
                                
                                let loginResponse = try decoder.decode([BannerResponse].self, from: responseData)
                                
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
                        
                        resolver.reject(error)
                    }
            }
        }
    }
    
    func getCategories() -> Promise<[CategoryResponse]> {
        
        let url = sAPIUrl + sCategory
        
        let decoder = JSONDecoder()
        
        decoder.keyDecodingStrategy = .useDefaultKeys
        
        var request = URLRequest(url: URL(string: url)!)
        
        request.httpMethod = HTTPMethod.get.rawValue
        
        request.timeoutInterval = 40
        
        request.httpBody = nil
        
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
                                
                                let loginResponse = try decoder.decode([CategoryResponse].self, from: responseData)
                                
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
                        
                        resolver.reject(error)
                    }
            }
        }
    }
    
    func getRates() -> Promise<[RateResponse]> {
        
        let url = sAPIUrl + sRates
        
        let decoder = JSONDecoder()
        
        decoder.keyDecodingStrategy = .useDefaultKeys
        
        var request = URLRequest(url: URL(string: url)!)
        
        request.httpMethod = HTTPMethod.get.rawValue
        
        request.timeoutInterval = 40
        
        request.httpBody = nil
        
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
                                
                                let loginResponse = try decoder.decode([RateResponse].self, from: responseData)
                                
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
                        
                        resolver.reject(error)
                    }
            }
        }
    }
}
