//
//  CartPdfTableViewCell.swift
//  ShineGlass
//
//  Created by dhruv dhola on 05/11/20.
//  Copyright © 2020 Tecocraft. All rights reserved.
//

import UIKit

class CartPdfTableViewCell: UITableViewCell {

//    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var pdfImageView: UIImageView!
    @IBOutlet weak var pdfNameLabel: UILabel!
    @IBOutlet weak var cancelButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
        self.pdfNameLabel.text = "Dipesh0089.jpg"
        self.pdfNameLabel.textColor = sGreyTextColor
        self.pdfNameLabel.font = AppFont.size14.sDINMedium
        
//        self.cancelButton.layer.cornerRadius = 15
//        self.cancelButton.layer.borderColor = sGreyBorderColor.cgColor
//        self.cancelButton.layer.borderWidth = 1.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
