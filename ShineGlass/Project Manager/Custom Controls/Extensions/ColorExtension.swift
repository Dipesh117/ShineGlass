//
//  ColorConstant.swift
//  Shine Glass
//
//  Created by Lucifer on 08/04/20.
//  Copyright © 2020 Tecocraft. All rights reserved.
//

import UIKit
import Foundation

//#MARK:- Extension Color
extension UIColor {
    
    convenience init(rgb: UInt) {
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}


extension UIApplication {
    
   /*var statusBarView: UIView? {
        if #available(iOS 13.0, *) {
            
            let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
            keyWindow?.addSubview(statusBarView)
            return statusBarView
            
        } else if responds(to: Selector(("statusBar"))) {
            
            return value(forKey: "statusBar") as? UIView
            
        } else {
            
            return nil
        }
    }*/
}
