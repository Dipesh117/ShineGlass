//
//  CartTableViewCell.swift
//  ShineGlass
//
//  Created by dhruv dhola on 05/11/20.
//  Copyright © 2020 Tecocraft. All rights reserved.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var categoryValueLabel: UILabel!
    @IBOutlet weak var subCategoryLabel: UILabel!
    @IBOutlet weak var subCategoryValueLabel: UILabel!
    @IBOutlet weak var thickNessLabel: UILabel!
    @IBOutlet weak var thickNessValueLabel: UILabel!
    @IBOutlet weak var widthLabel: UILabel!
    @IBOutlet weak var widthValueLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var heightValueLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var quantityValueLabel: UILabel!
    @IBOutlet weak var scaleLabel: UILabel!
    @IBOutlet weak var scaleValueLabel: UILabel!
    @IBOutlet weak var removeButton: UIButton!
    @IBOutlet weak var dropShadow: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
        self.categoryLabel.text = "CATEGORY"
        self.categoryLabel.textColor = sBlackTextColor
        self.categoryLabel.font = AppFont.size14.sDINBold
                self.categoryValueLabel.text = "CLEAR GLASS"
        self.categoryValueLabel.textColor = sBlackTextColor
        self.categoryValueLabel.font = AppFont.size14.sDINBold
        
        self.subCategoryLabel.text = "SUBCATEGORY"
        self.subCategoryLabel.textColor = sBlackTextColor
        self.subCategoryLabel.font = AppFont.size14.sDINBold
                self.subCategoryValueLabel.text = "CLEAR GLASS1"
        self.subCategoryValueLabel.textColor = sBlackTextColor
        self.subCategoryValueLabel.font = AppFont.size14.sDINBold
        
        self.thickNessLabel.text = "THICKNESS"
        self.thickNessLabel.textColor = sBlackTextColor
        self.thickNessLabel.font = AppFont.size14.sDINBold
        self.thickNessValueLabel.text = "0.1"
        self.thickNessValueLabel.textColor = sBlackTextColor
        self.thickNessValueLabel.font = AppFont.size14.sDINBold
        
        self.widthLabel.text = "WIDTH"
        self.widthLabel.textColor = sBlackTextColor
        self.widthLabel.font = AppFont.size14.sDINBold
                self.widthValueLabel.text = "0.1"
        self.widthValueLabel.textColor = sBlackTextColor
        self.widthValueLabel.font = AppFont.size14.sDINBold
        
        self.heightLabel.text = "HEIGHT"
        self.heightLabel.textColor = sBlackTextColor
        self.heightLabel.font = AppFont.size14.sDINBold
                self.heightValueLabel.text = "0.1"
        self.heightValueLabel.textColor = sBlackTextColor
        self.heightValueLabel.font = AppFont.size14.sDINBold
        
        self.quantityLabel.text = "QUANTITY"
        self.quantityLabel.textColor = sBlackTextColor
        self.quantityLabel.font = AppFont.size14.sDINBold
                self.quantityValueLabel.text = "1"
        self.quantityValueLabel.textColor = sBlackTextColor
        self.quantityValueLabel.font = AppFont.size14.sDINBold
        
        self.scaleLabel.text = "SCALE"
        self.scaleLabel.textColor = sBlackTextColor
        self.scaleLabel.font = AppFont.size14.sDINBold
                self.quantityValueLabel.text = "MM"
        self.scaleValueLabel.textColor = sBlackTextColor
        self.scaleValueLabel.font = AppFont.size14.sDINBold
        

        self.removeButton.setTitleColor(.white, for: .normal)
        self.removeButton.setTitle("REMOVE", for: .normal)
        self.removeButton.setupCornerRadius(radius: self.removeButton.frame.height / 2)
        self.removeButton.setupGrediant()
        self.dropShadow.dropShadow()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}
