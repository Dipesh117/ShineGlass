//
//  AppConstant.swift
//  Shine Glass
//
//  Created by Lucifer on 08/04/20.
//  Copyright © 2020 Tecocraft. All rights reserved.
//

import UIKit
import Foundation
import ObjectMapper
import NVActivityIndicatorView

//#MARK:- APP INFORMATIONS
let APP_Title = "Shine Glass"
let APP_Currency = "$"

var appVersion : String {
    get {
        return Bundle.main.infoDictionary!["CFBundleShortVersionString"] as? String ?? "nil"
    }
}

var systemVersion : String {
    get {
        return UIDevice.current.systemVersion
    }
}

//#MARK:- SCREEN-SIZES
let SCREEN = UIScreen.main.bounds
let SCREEN_WIDTH = UIScreen.main.bounds.size.width
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
let iphone4 = UIScreen.main.bounds.size.height == 480
let iphone5 = UIScreen.main.bounds.size.height == 568
let iphone6i7 = UIScreen.main.bounds.size.height == 667
let iphone6i7plus = UIScreen.main.bounds.size.height == 736
let iphoneX = UIScreen.main.bounds.size.height == 812


//#MARK: TOP AND BOTTOM PADDING WITH SAFE-AREA
//var topPadding:CGFloat {
//    get {
//        if #available(iOS 11.0, *) {
//
//            let window = UIApplication.shared.keyWindow
//
//            return window?.safeAreaInsets.top ?? 0.0
//        }else {
//            return 20.0
//        }
//    }
//}
//
//var bottomPadding:CGFloat {
//    get {
//        if #available(iOS 11.0, *) {
//
//            let window = UIApplication.shared.keyWindow
//
//            return window?.safeAreaInsets.bottom ?? 0.0
//        }else {
//            return 0.0
//        }
//    }
//}


//#MARK:- APP-LOADER
//let sLoaderView = NVActivityIndicatorView(frame: CGRect(x: (SCREEN_WIDTH / 2) -  25, y: (SCREEN_HEIGHT / 2) - 25, width: 50, height: 50), type: NVActivityIndicatorType.circleStrokeSpin, color: sFirstThemeBlueColor, padding: 5.0)

let sLoaderView = NVActivityIndicatorView(frame: CGRect(x: 0.0, y: 0.0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT), type: NVActivityIndicatorType.circleStrokeSpin, color: sWhiteThemeColor, padding: SCREEN_WIDTH/2.2)

//#MARK:- Key Window
let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first

//#MARK:- IMAGES
let sPlaceholderImage = UIImage(named: "ic_placeholder")!

let sCornerRadius = CGFloat(10.0)

//#MARK: APP-STORYBOARD CONSTANTS
enum AppStoryboard : String {
    
    case Authentication = "Authentication"
    case Menu = "Menu"
    case MyAccount = "MyAccount"
    case MainTab = "MainTab"
    case Discover = "Discover"
    case Entries = "Entries"
    case Results = "Results"
    case Gallery = "Gallery"
    case Members = "Members"
    
    var instance : UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
}

//#MARK: ERROR MESSAGE//
let sAlertPleaseTryLater = "Please try later."
let sAlertCheckInternet = "Please check your internet connectivity."
let sAlertSomethingWrong = "Something went wrong. Please retry."
let sAlertUnauthenticated = "Token expired : Please login again."


//var bookmarkedNews: [LatestNewsData] {
//
//    if let bookmarkNews = UserDefaultsKeys.appMainKey.bookmarks.instance as? String {
//
//        let resultData = Mapper<LatestNewsData>().mapArray(JSONString: bookmarkNews)
//
//        return resultData ?? [LatestNewsData]()
//    }
//    else {
//
//        return [LatestNewsData]()
//    }
//}
