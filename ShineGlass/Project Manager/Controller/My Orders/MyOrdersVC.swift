//
//  MyOrdersVC.swift
//  ShineGlass
//
//  Created by Lucifer on 02/11/20.
//  Copyright © 2020 Tecocraft. All rights reserved.
//

import UIKit
import SideMenu

class MyOrdersVC: BaseVC {

    //#MARK:- Outlets
    @IBOutlet weak var navView: NavigationView!
    
    @IBOutlet weak var rupeeBtn: UIButton!
    
    @IBOutlet weak var walletLbl: Medium8Blue!
    
    @IBOutlet weak var myWalletBtn: UIButton!
    
    @IBOutlet weak var cardLbl: Medium8Blue!
    
    @IBOutlet weak var mycartBtn: UIButton!
    
    @IBOutlet weak var menuBtn: UIButton!
    
    @IBOutlet weak var logoImgvw: UIImageView!
    
    //#MARK:- Declarations
    
    
    //#MARK:- Setup View
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.setupView()
    }
    
    func setupView() {
     
        self.view.backgroundColor = sWhiteThemeColor
        
        self.rupeeBtn.setTitleColor(sFirstThemeBlueColor, for: .normal)
    }

    //#MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "presentSideMenu" {
            
            guard let sideMenuNavigationController = segue.destination as? SideMenuNavigationController else { return }
            sideMenuNavigationController.modalPresentationStyle = .overFullScreen
            sideMenuNavigationController.settings = CustomFunction().makeSettings()
        }
    }
    
    //#MARK:- Button Action
    @IBAction func handleMyWalletClick(_ sender: Any) {
        
    }
    
    @IBAction func handleMyCartClick(_ sender: Any) {
        
    }
}
