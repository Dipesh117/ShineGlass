//
//  SemiBold10Black.swift
//  ShineGlass
//
//  Created by Lucifer on 26/10/20.
//  Copyright © 2020 Tecocraft. All rights reserved.
//

import UIKit
import Foundation

@IBDesignable
class SemiBold10Black: UILabel {
    
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
        
        self.font =  AppFont.size10.sSemiBold
        
        self.textColor = sBlackTextColor
    }
}
