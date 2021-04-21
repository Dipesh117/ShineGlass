//
//  MeasurementVC.swift
//  ShineGlass
//
//  Created by Lucifer on 05/11/20.
//  Copyright © 2020 Tecocraft. All rights reserved.
//

import UIKit

class MeasurementVC: BaseVC {
    
    //#MARK:- Outlets
    @IBOutlet weak var navView: UIView!
    
    @IBOutlet weak var imgvwBack: UIImageView!
    
    @IBOutlet weak var btnCart: UIButton!
    
    @IBOutlet weak var btnBack: UIButton!
    
    @IBOutlet weak var lblTitle: SemiBold18Black!
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var lblSubTitle: SemiBold18Black!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var viewUnit: UIView!
    
    @IBOutlet weak var btnThickness: UIButton!
    
    @IBOutlet weak var btnWidth: UIButton!
    
    @IBOutlet weak var btnHeight: UIButton!
    
    @IBOutlet weak var btnQuantity: UIButton!
    
    @IBOutlet weak var txtQuantity: UITextField!
    
    @IBOutlet weak var viewUploadImage: UIView!
    
    @IBOutlet weak var viewAddToCart: UIView!
    
    @IBOutlet weak var imgvwCart: UIImageView!
    
    @IBOutlet weak var btnAddToCart: UIButton!
    
    //#MARK:- Declaration
    var strTitle = String()
    
    var strSubTitle = String()
    
    //#MARK:- Setup View
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupView()
    }
    
    func setupView() {
        
        self.setNeedsStatusBarAppearanceUpdate()
        
        self.view.backgroundColor = sFirstThemeBlueColor
        
        self.navView.backgroundColor = sWhiteThemeColor
        
        self.btnThickness.titleLabel?.font = AppFont.size16.sRegular
        
        self.btnWidth.titleLabel?.font = AppFont.size16.sRegular
        
        self.btnHeight.titleLabel?.font = AppFont.size16.sRegular
        
        self.btnQuantity.titleLabel?.font = AppFont.size16.sRegular
        
        self.btnThickness.setTitleColor(sBlackTextColor, for: .normal)
        
        self.btnWidth.setTitleColor(sBlackTextColor, for: .normal)
        
        self.btnHeight.setTitleColor(sBlackTextColor, for: .normal)
        
        self.btnQuantity.setTitleColor(sBlackTextColor, for: .normal)
        
        self.txtQuantity.font = AppFont.size16.sRegular
        
        self.txtQuantity.setColorPlaceHolder(color: sBlackTextColor)
        
        self.imgvwCart.image = UIImage(named: "ic_cart")?.withRenderingMode(.alwaysTemplate)
        
        self.imgvwCart.tintColor = sWhiteThemeColor
        
        self.view.layoutIfNeeded()
        
        self.viewUploadImage.setupDashedBorder(dashWidth: 1.0, borderColor: sFirstThemeBlueColor, dashLength: 5.0, betweenDashesSpace: 2.5, cornerRadius: 2.0)
        
        self.lblTitle.text = strTitle
        
        self.lblSubTitle.text = strSubTitle
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        
        return .lightContent
    }
    
    //#MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    //#MARK:- Button Action
    @IBAction func handleBackClick(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func handleAddToCartClick(_ sender: Any) {
        
    }
    
    @IBAction func handleThicknessClick(_ sender: Any) {
        
    }
    
    @IBAction func handleWidthClick(_ sender: Any) {
        
    }
    
    @IBAction func handleHeightClick(_ sender: Any) {
        
    }
    
    @IBAction func handleQuantityClick(_ sender: Any) {
        
    }
}
