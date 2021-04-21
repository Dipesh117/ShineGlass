//
//  Medium10Blue.swift
//  ShineGlass
//
//  Created by Lucifer on 21/10/20.
//  Copyright © 2020 Tecocraft. All rights reserved.
//

import UIKit
import Foundation

@IBDesignable
class Medium10Blue: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }
    
    override func prepareForInterfaceBuilder() {
        sharedInit()
    }
    
    func sharedInit() {
        
        self.font =  AppFont.size10.sMedium
        
        self.textColor = sFirstThemeBlueColor
    }
}
