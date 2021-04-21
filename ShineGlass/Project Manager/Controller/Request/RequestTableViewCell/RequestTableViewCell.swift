//
//  RequestTableViewCell.swift
//  ShineGlass
//
//  Created by dhruv dhola on 30/10/20.
//  Copyright © 2020 Tecocraft. All rights reserved.
//

import UIKit

class RequestTableViewCell: UITableViewCell {

    //#MARK:- Outlets
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var requestNoLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var requestValueLabel: UILabel!
    @IBOutlet weak var dateValueLabel: UILabel!
    
    //#MARK:- Setup View
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.shadowView.dropShadow()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
