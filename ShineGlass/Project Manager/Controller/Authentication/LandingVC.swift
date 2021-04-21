//
//  LandingVC.swift
//  ShineGlass
//
//  Created by Lucifer on 06/10/20.
//  Copyright © 2020 Tecocraft. All rights reserved.
//

import UIKit

class LandingVC: UIViewController {

    //#MARK:- Outlets
    @IBOutlet weak var imgvwBackground: UIImageView!
    
    @IBOutlet weak var imgvwLogo: UIImageView!
    
    @IBOutlet weak var viewLogin: UIView!
    
    @IBOutlet weak var btnLogin: UIButton!
    
    @IBOutlet weak var viewLoginOTP: UIView!
    
    @IBOutlet weak var btnLoginOTP: UIButton!
    
    @IBOutlet weak var lblLoginWith: SemiBold15Grey!
    
    @IBOutlet weak var btnFacebook: UIButton!
    
    @IBOutlet weak var btnGoogle: UIButton!
    
    @IBOutlet weak var lblOR: SemiBold15Grey!
    
    @IBOutlet weak var btnSignUp: UIButton!
    
    //#MARK:- Setup View
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if authToken != "" {
            
            self.performSegue(withIdentifier: "showHomeVC", sender: nil)
        }
        else {
            
            self.setupView()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        self.viewLogin.setupGrediant()
    }
    
    func setupView() {
        
        self.setNeedsStatusBarAppearanceUpdate()
        
        self.view.backgroundColor = sFirstThemeBlueColor
        
        self.viewLogin.setupCornerRadius(radius: self.viewLogin.frame.height/2)
        
        self.viewLoginOTP.setupBorderWithCornerRadius(borderWidth: 1.0, borderColor: sFirstThemeBlueColor, cornerRadius: self.viewLoginOTP.frame.height/2)
        
        self.btnFacebook.setupBorderWithCornerRadius(borderWidth: 1.0, borderColor: sGreyBorderColor, cornerRadius: self.btnFacebook.frame.height/2)
        
        self.btnGoogle.setupBorderWithCornerRadius(borderWidth: 1.0, borderColor: sGreyBorderColor, cornerRadius: self.btnFacebook.frame.height/2)
        
        self.btnLoginOTP.titleLabel?.font = AppFont.size14.sMedium
        
        self.btnLoginOTP.setTitleColor(sBlackTextColor, for: .normal)
        
        self.btnFacebook.titleLabel?.font = AppFont.size14.sMedium
        
        self.btnGoogle.titleLabel?.font = AppFont.size14.sMedium
        
        self.btnFacebook.setTitleColor(sBlackTextColor, for: .normal)
        
        self.btnGoogle.setTitleColor(sBlackTextColor, for: .normal)
        
        self.btnSignUp.setAttributedTitle(CustomFunction().setAttributedString(strNormal: "Don't have an Account?", normalFont: AppFont.size13.sMedium, normalColor: sGreyTextColor, strAttributed: " Signup", attributedFont: AppFont.size14.sExtraBold, attributedColor: sFirstThemeBlueColor), for: .normal)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        
        return .lightContent
    }
    
    //#MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    //#MARK:- Button Action
    @IBAction func handleLoginClick(_ sender: Any) {
        
        self.performSegue(withIdentifier: "showLoginVC", sender: nil)
    }
    
    @IBAction func handleLoginWithOTPClick(_ sender: Any) {
        
        self.performSegue(withIdentifier: "showLoginWithOTPVC", sender: nil)
    }
    
    @IBAction func handleLoginWithFacebookClick(_ sender: Any) {
        
    }
    
    @IBAction func handleLoginWithGoogleClick(_ sender: Any) {
        
    }
    
    @IBAction func handleSignupClick(_ sender: Any) {
        
        self.performSegue(withIdentifier: "showSignupVC", sender: nil)
    }
}
