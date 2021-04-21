//
//  DeviderLabel.swift
//  ShineGlass
//
//  Created by Lucifer on 06/10/20.
//  Copyright © 2020 Tecocraft. All rights reserved.
//

import UIKit
import Foundation

@IBDesignable
class DeviderLabel: UILabel {
    
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
        
        self.backgroundColor = sGreyBorderColor
    }
}
