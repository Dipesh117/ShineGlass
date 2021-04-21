//
//  HistoryTableViewCell.swift
//  ShineGlass
//
//  Created by dhruv dhola on 04/11/20.
//  Copyright © 2020 Tecocraft. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var noLabel: UILabel!
    @IBOutlet weak var shadowView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
        self.noLabel.textColor = sGreyTextColor
        self.noLabel.font = AppFont.size14.sRegular
        self.shadowView.dropShadow()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
