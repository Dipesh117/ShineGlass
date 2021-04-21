//
//  SemiBold15Grey.swift
//  ShineGlass
//
//  Created by Lucifer on 06/10/20.
//  Copyright © 2020 Tecocraft. All rights reserved.
//

import UIKit
import Foundation

@IBDesignable
class SemiBold15Grey: UILabel {
    
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
        
        self.font =  AppFont.size15.sSemiBold
        
        self.textColor = sGreyTextColor
    }
}
