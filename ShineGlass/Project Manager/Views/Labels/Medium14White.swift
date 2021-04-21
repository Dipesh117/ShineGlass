//
//  Medium14White.swift
//  ShineGlass
//
//  Created by Lucifer on 05/10/20.
//  Copyright © 2020 Tecocraft. All rights reserved.
//

import UIKit
import Foundation

@IBDesignable
class Medium14White: UILabel {
    
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
        
        self.font =  AppFont.size15.sMedium
        
        self.textColor = sWhiteThemeColor
    }
}
