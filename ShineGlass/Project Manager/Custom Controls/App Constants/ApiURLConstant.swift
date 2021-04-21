//
//  ApiURLConstant.swift
//  Shine Glass
//
//  Created by Lucifer on 10/07/20.
//  Copyright © 2020 Tecocraft. All rights reserved.
//

import Foundation

let sDevBaseUrl = "3.131.127.136:3000/"

let sLiveBaseUrl = "3.131.127.136:3000/"

#if DEBUG
var sBaseUrl = sDevBaseUrl
#else
var sBaseUrl = sLiveBaseUrl
#endif

let sApi = "api/"

var sAPIUrl = "http://" + sBaseUrl + sApi

var sImageURL = "http://" + sBaseUrl

//#MARK:- Constant
let sAuth = "auth/"

//#MARK:- Methods
// Authentication
let sRegister = sAuth + "register"
let sLogin = sAuth + "login"
let sNumberLogin = sAuth + "number_login"


// Home
let sBanner = "banner"
let sCategory = "category"
let sRates = "rates"

//Request
let sQuotation = "quotation"
