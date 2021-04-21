//
//  ImageViewExtension.swift
//  ShineGlass
//
//  Created by Lucifer on 02/11/20.
//  Copyright © 2020 Tecocraft. All rights reserved.
//

import UIKit
import SDWebImage
import Foundation

extension UIImageView {
    
    func setupImage(image: String) {
        
        if let url = URL.init(string: image) {
            
            self.sd_setImage(with: url, placeholderImage: sPlaceholderImage, options: [SDWebImageOptions.continueInBackground, SDWebImageOptions.lowPriority, SDWebImageOptions.refreshCached, SDWebImageOptions.handleCookies, SDWebImageOptions.retryFailed], progress: nil, completed: { (image, error, cacheType, url) in
                
                if error == nil {
                  
                    self.image = image
                }
                else {
                    
                    self.image = sPlaceholderImage
                }
                
            })
        }
        else {
            
            self.image = sPlaceholderImage
        }
    }
}

extension UIImage {
    
    class func imageWithColor(color: UIColor, size: CGSize) -> UIImage {
        
        let rect: CGRect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}
