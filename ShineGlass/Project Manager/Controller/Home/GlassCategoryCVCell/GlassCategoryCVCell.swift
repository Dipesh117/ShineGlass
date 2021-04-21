//
//  GlassCategoryCVCell.swift
//  ShineGlass
//
//  Created by Lucifer on 05/11/20.
//  Copyright © 2020 Tecocraft. All rights reserved.
//

import UIKit

class GlassCategoryCVCell: UICollectionViewCell {

    //#MARK:- Outlets
    @IBOutlet weak var viewBg: UIView!
    
    @IBOutlet weak var titleLbl: Medium14White!
    
    //#MARK:- Setup View
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.contentView.backgroundColor = sWhiteThemeColor
        
        self.viewBg.backgroundColor = sFirstThemeBlueColor
        
        self.viewBg.setupCornerRadius(radius: 2.0)
        
        self.viewBg.dropShadow()
    }
    
    //#MARK:- Setup Cell Data
    func setupCellData(title: String) {
        
        self.titleLbl.text = title
    }
}
