//
//  ProfileTableViewCell.swift
//  ShineGlass
//
//  Created by dhruv dhola on 04/11/20.
//  Copyright © 2020 Tecocraft. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileImageButton: UIButton!
    @IBOutlet weak var personalDetailLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phnoLabel: UILabel!
    @IBOutlet weak var nameValueLabel: UILabel!
    @IBOutlet weak var emailValueLabel: UILabel!
    @IBOutlet weak var phnoValueLabel: UILabel!
    @IBOutlet weak var changePasswordButton: UIButton!
    @IBOutlet weak var addressButton: UIButton!
    @IBOutlet weak var shadowView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.setUpView()
    }
    
    func setUpView() {
        self.selectionStyle = .none
        self.personalDetailLabel.text = "PERSONAL DETAILS"
        self.personalDetailLabel.textColor = sBlackTextColor
        self.personalDetailLabel.font = AppFont.size14.sDINBold
        self.nameLabel.text = "NAME"
        self.nameLabel.textColor = sBlackTextColor
        self.nameLabel.font = AppFont.size12.sDINBold
        self.emailLabel.text = "EMAIL"
        self.emailLabel.textColor = sBlackTextColor
        self.emailLabel.font = AppFont.size12.sDINBold
        self.phnoLabel.text = "PH NO."
        self.phnoLabel.textColor = sBlackTextColor
        self.phnoLabel.font = AppFont.size12.sDINBold
        
        self.nameValueLabel.textColor = sBlackTextColor
        self.nameValueLabel.font = AppFont.size12.sDINBold
        
        self.emailValueLabel.textColor = sBlackTextColor
        self.emailValueLabel.font = AppFont.size12.sDINBold
        
        self.phnoValueLabel.textColor = sBlackTextColor
        self.phnoValueLabel.font = AppFont.size12.sDINBold
        
        self.changePasswordButton.layer.cornerRadius = 20
        self.changePasswordButton.layer.borderColor = sGreyBorderColor.cgColor
        self.changePasswordButton.layer.borderWidth = 0.6
        
        self.addressButton.layer.cornerRadius = 20
        self.addressButton.layer.borderColor = sGreyBorderColor.cgColor
        self.addressButton.layer.borderWidth = 0.6
        
        self.changePasswordButton.setTitle("Change Password", for: .normal)
        self.addressButton.setTitle("My Address", for: .normal)
        self.changePasswordButton.titleLabel?.font = AppFont.size12.sRegular
        self.addressButton.titleLabel?.font = AppFont.size12.sDINBold
        self.addressButton.setTitleColor(sGreyTextColor, for: .normal)
        self.changePasswordButton.setTitleColor(sGreyTextColor, for: .normal)
        self.shadowView.dropShadow()
        
        self.profileImageView.layer.cornerRadius = self.profileImageView.frame.width / 2
        self.profileImageView.layer.borderColor = sGreyBorderColor.cgColor
        self.profileImageView.backgroundColor = .white
        self.profileImageView.layer.borderWidth = 1.5
//        self.addressButton.image
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
