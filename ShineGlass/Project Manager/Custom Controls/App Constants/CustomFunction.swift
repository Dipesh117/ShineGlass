//
//  CustomFunction.swift
//  ShineGlass
//
//  Created by Lucifer on 06/10/20.
//  Copyright © 2020 Tecocraft. All rights reserved.
//

import UIKit
import SideMenu
import Foundation

public class CustomFunction {
    
    /*
        Manage Attributed String
    */
    func setAttributedString(strNormal: String, normalFont: UIFont, normalColor: UIColor, strAttributed: String, attributedFont: UIFont, attributedColor: UIColor) -> NSAttributedString {
        
        let attributedString1 = NSAttributedString(string: strNormal, attributes: [NSAttributedString.Key.font : normalFont, NSAttributedString.Key.foregroundColor : normalColor])
        
        let attributedString2 = NSAttributedString(string: strAttributed, attributes: [NSAttributedString.Key.font : attributedFont, NSAttributedString.Key.foregroundColor : attributedColor])
        
        let attrib = NSMutableAttributedString(attributedString: attributedString1)
        
        attrib.append(attributedString2)
        
        return attrib
    }
    
    /*
        Setup Side Menu Settings
    */
    func makeSettings() -> SideMenuSettings {
        let presentationStyle = SideMenuPresentationStyle.menuSlideIn
        presentationStyle.backgroundColor = sBlackBackgroundColor.withAlphaComponent(0.5)
        presentationStyle.menuStartAlpha = CGFloat(0.5)
        presentationStyle.menuScaleFactor = CGFloat(1)
        presentationStyle.onTopShadowOpacity = 1.0
        presentationStyle.presentingEndAlpha = 0.4
        presentationStyle.presentingScaleFactor = CGFloat(1.0)
        
        var settings = SideMenuSettings()
        settings.presentationStyle = presentationStyle
        settings.menuWidth = SCREEN_WIDTH/1.4
       
        settings.blurEffectStyle = .none
        settings.statusBarEndAlpha = 0
        
        return settings
    }
}
