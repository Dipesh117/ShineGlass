//
//  TextFieldExtension.swift
//  ShineGlass
//
//  Created by Lucifer on 12/10/20.
//  Copyright © 2020 Tecocraft. All rights reserved.
//

import UIKit
import Foundation

extension UITextField {

    //ADD PADDING TO TEXT FIELD
    func addPadding(size : CGFloat){
        let paddingView:UIView = UIView(frame: CGRect(x:0, y:0,width: size,height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = UITextField.ViewMode.always
    }
    
    //CHANGE COLOR OF PLACEHOLDER TO TEXT FIELD
    func setColorPlaceHolder(color: UIColor = sGreyTextColor) {
        self.attributedPlaceholder = NSAttributedString(string: self.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor: color, NSAttributedString.Key.font: self.font as Any])
    }
    
    //SET IMAGE TO TEXT FIELD TO LEFT
    func setImageToLeft(img: UIImage) {
        
        let view = UIView(frame: CGRect(x: 0.0, y: self.frame.height/2.0, width: 25.0, height: 30.0))
        
        view.backgroundColor = sWhiteThemeColor
        
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0.0, y: (view.frame.height/2.0) - 8.0, width: 15.0, height: 15.0)
        imageView.contentMode = .scaleAspectFit
        imageView.image = img
        
        view.addSubview(imageView)
        
        self.leftView = view
        self.leftViewMode = .always
    }
}
