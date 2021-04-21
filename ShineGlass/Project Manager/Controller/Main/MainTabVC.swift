//
//  MainTabVC.swift
//  ShineGlass
//
//  Created by Lucifer on 20/10/20.
//  Copyright © 2020 Tecocraft. All rights reserved.
//

import UIKit

class MainTabVC: UITabBarController {

    //#MARK:- Setup View
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupView()
    }
    
    func setupView() {
        
        self.setNeedsStatusBarAppearanceUpdate()
        
        UITabBar.appearance().barTintColor = sWhiteThemeColor
        
        UITabBar.appearance().tintColor = sBlackTextColor
        
        UITabBar.appearance().unselectedItemTintColor = sBlackTextColor
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: sBlackTextColor, .font: AppFont.size10.sDINMedium], for: .normal)
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: sBlackTextColor, .font: AppFont.size10.sDINMedium], for: .selected)
    }

    override func viewDidAppear(_ animated: Bool) {
        
        let numberOfItems = CGFloat((self.tabBar.items!.count))
        
        let tabBarItemSize = CGSize(width: (self.tabBar.frame.width) / numberOfItems,
                                    height: (self.tabBar.frame.height))
        
        self.tabBar.selectionIndicatorImage
            = UIImage.imageWithColor(color: sGreyBackgroundColor,
                                     size: tabBarItemSize).resizableImage(withCapInsets: .zero)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        
        return .darkContent
    }
    
    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
