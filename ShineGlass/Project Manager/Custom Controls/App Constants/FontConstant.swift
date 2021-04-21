//
//  FontConstant.swift
//  Shine Glass
//
//  Created by Lucifer on 08/04/20.
//  Copyright © 2020 Tecocraft. All rights reserved.
//

import UIKit
import Foundation


//#MARK: FONT- SIZE

func fontSizeSeprated(size: CGFloat) -> CGFloat {
    
    if iphone4 {
        return size - 1.5
    }else if iphone5 {
        return size - 1.0
    }else if iphone6i7 {
        return size
    }else if iphone6i7plus {
        return size + 1.0
    }else if iphoneX {
        return size + 1.2
    }else {
        return size + 1.8
    }
}

enum AppFont : CGFloat {
    case size7 = 7.0
    case size8 = 8.0
    case size9 = 9.0
    case size10 = 10.0
    case size11 = 11.0
    case size12 = 12.0
    case size13 = 13.0
    case size14 = 14.0
    case size15 = 15.0
    case size16 = 16.0
    case size17 = 17.0
    case size18 = 18.0
    case size19 = 19.0
    case size20 = 20.0
    case size21 = 21.0
    case size22 = 22.0
    case size23 = 23.0
    case size24 = 24.0
    case size25 = 25.0
    case size26 = 26.0
    case size27 = 27.0
    case size28 = 28.0
    case size29 = 29.0
    case size30 = 30.0
    case size31 = 31.0
    case size32 = 32.0
    case size33 = 33.0
    case size34 = 34.0
    case size35 = 35.0
    case size36 = 36.0
    case size37 = 37.0
    case size38 = 38.0
    case size39 = 39.0
    case size40 = 40.0
    
    var sBlack : UIFont {
        return UIFont.init(name: sFontRalewayBlack, size:  fontSizeSeprated(size: self.rawValue))!
    }
    
    var sExtraBold : UIFont {
        return UIFont.init(name: sFontRalewayExtraBold, size:  fontSizeSeprated(size: self.rawValue))!
    }
    
    var sBold : UIFont {
//        return UIFont.init(name: sFontRalewayBold, size:  fontSizeSeprated(size: self.rawValue))!
        return UIFont.init(name: sFontHeeboSemiBold, size:  fontSizeSeprated(size: self.rawValue))!
    }
    
    var sSemiBold : UIFont {
//        return UIFont.init(name: sFontRalewaySemiBold, size:  fontSizeSeprated(size: self.rawValue))!
        return UIFont.init(name: sFontHeeboSemiBold, size:  fontSizeSeprated(size: self.rawValue))!
    }
    
    var sMedium : UIFont {
//        return UIFont.init(name: sFontRalewayMedium, size:  fontSizeSeprated(size: self.rawValue))!
        return UIFont.init(name: sFontHeeboMedium, size:  fontSizeSeprated(size: self.rawValue))!
    }
    
    var sRegular : UIFont {
//        return UIFont.init(name: sFontRalewayRegular, size:  fontSizeSeprated(size: self.rawValue))!
        return UIFont.init(name: sFontHeeboRegular, size:  fontSizeSeprated(size: self.rawValue))!
    }
    
    var sLight : UIFont {
//        return UIFont.init(name: sFontRalewayRegular, size:  fontSizeSeprated(size: self.rawValue))!
        return UIFont.init(name: sFontHeeboLight, size:  fontSizeSeprated(size: self.rawValue))!
    }
    
    var sDINMedium : UIFont {
//        return UIFont.init(name: sFontDINProCondensedMedium, size:  fontSizeSeprated(size: self.rawValue))!
        return UIFont.init(name: sFontHeeboRegular, size:  fontSizeSeprated(size: self.rawValue))!
    }
    
    var sDINBold : UIFont {
//        return UIFont.init(name: sFontDINProCondensedBold, size:  fontSizeSeprated(size: self.rawValue))!
        return UIFont.init(name: sFontHeeboMedium, size:  fontSizeSeprated(size: self.rawValue))!
    }
}

let sDefaultFontSizeVerySmall8=fontSizeSeprated(size: 8.0)
let sDefaultFontSizeVerySmall9=fontSizeSeprated(size: 9.0)
let sDefaultFontSizeVerySmall10=fontSizeSeprated(size: 10.0)
let sDefaultFontSizeSmall11=fontSizeSeprated(size: 11.0)
let sDefaultFontSizeSmall12=fontSizeSeprated(size: 12.0)
let sDefaultFontSizeMedium13=fontSizeSeprated(size: 13.0)
let sDefaultFontSizeMedium14=fontSizeSeprated(size: 14.0)
let sDefaultFontSizeLarge15=fontSizeSeprated(size: 15.0)
let sDefaultFontSizeLarge16=fontSizeSeprated(size: 16.0)
let sDefaultFontSizeLarge17=fontSizeSeprated(size: 17.0)
let sDefaultFontSizeExtraLarge18=fontSizeSeprated(size: 18.0)
let sDefaultFontSizeExtraLarge19=fontSizeSeprated(size: 19.0)
let sDefaultFontSizeExtraLarge20=fontSizeSeprated(size: 20.0)
let sDefaultFontSizeExtraLarge21=fontSizeSeprated(size: 21.0)
let sDefaultFontSizeExtraLarge22=fontSizeSeprated(size: 22.0)
let sDefaultFontSizeExtraLarge23=fontSizeSeprated(size: 23.0)
let sDefaultFontSizeExtraLarge24=fontSizeSeprated(size: 24.0)
let sDefaultFontSizeExtraLarge25=fontSizeSeprated(size: 25.0)
let sDefaultFontSizeExtraLarge26=fontSizeSeprated(size: 26.0)
let sDefaultFontSizeExtraLarge27=fontSizeSeprated(size: 27.0)
let sDefaultFontSizeExtraLarge28=fontSizeSeprated(size: 28.0)
let sDefaultFontSizeExtraLarge29=fontSizeSeprated(size: 29.0)
let sDefaultFontSizeExtraLarge30=fontSizeSeprated(size: 30.0)

let sDefaultFontSizeExtraLarge32=32.0
let sDefaultFontSizeExtraLarge36=36.0
let sDefaultFontSizeExtraLarge40=40.0
let sDefaultFontSizeExtraLarge150=150.0

//#MARK: FONT
let sFontRalewayBlack = "Raleway-Black"
let sFontRalewayExtraBold = "Raleway-ExtraBold"
let sFontRalewayBold = "Raleway-Bold"
let sFontRalewaySemiBold = "Raleway-SemiBold"
let sFontRalewayMedium = "Raleway-Medium"
let sFontRalewayRegular = "Raleway-Regular"

let sFontDINProCondensedMedium = "DINPro-CondensedMedium"
let sFontDINProCondensedBold = "DINPro-CondensedBold"

let sFontHeeboSemiBold = "Heebo-SemiBold"
let sFontHeeboMedium = "Heebo-Medium"
let sFontHeeboRegular = "Heebo-Regular"
let sFontHeeboLight = "Heebo-Light"
let sFontHeeboThin = "Heebo-Thin"



