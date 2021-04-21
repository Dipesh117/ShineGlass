//
//  ViewExtension.swift
//  ShineGlass
//
//  Created by Lucifer on 06/10/20.
//  Copyright © 2020 Tecocraft. All rights reserved.
//

import UIKit
import Foundation


extension UIView {
    
    func setupBorderWithCornerRadius(borderWidth: CGFloat, borderColor: UIColor, cornerRadius: CGFloat) {
        
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        self.layer.masksToBounds = true
    }
    
    func setupCornerRadius(radius: CGFloat) {
        
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    
    func setupGrediant() {
        
        let background = CAGradientLayer().backgroundGradientColor()
        background.frame = self.bounds
        self.layer.insertSublayer(background, at: 0)
    }
    
    func dropShadow() {
        
        self.layer.masksToBounds = false
        
        self.layer.shadowColor = UIColor.black.cgColor
        
        self.layer.shadowOpacity = 0.3
        
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.5)
        
        self.layer.shadowRadius = 2
        
        self.layer.shouldRasterize = false
    }
    
    func setupDashedBorder(dashWidth: CGFloat, borderColor: UIColor, dashLength: CGFloat = 0, betweenDashesSpace: CGFloat = 0, cornerRadius: CGFloat = 0) {
        
        let dashBorder = CAShapeLayer()
        dashBorder.lineWidth = dashWidth
        dashBorder.strokeColor = borderColor.cgColor
        dashBorder.lineDashPattern = [dashLength, betweenDashesSpace] as [NSNumber]
        dashBorder.frame = bounds
        dashBorder.fillColor = nil
        
        if cornerRadius > 0 {
            dashBorder.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        }
        else {
            dashBorder.path = UIBezierPath(rect: bounds).cgPath
        }
        
        layer.addSublayer(dashBorder)
    }
}

extension CAGradientLayer {

    func backgroundGradientColor() -> CAGradientLayer {

        let gradientColors: [CGColor] = [sFirstThemeBlueColor.cgColor, sSecondThemeBlueLightColor.cgColor]

        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.startPoint = CGPoint(x: 0.0,y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0,y: 0.5)
        gradientLayer.type = .axial

        return gradientLayer
    }
}
