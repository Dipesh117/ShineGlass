//
//  VerifyOTPVC.swift
//  ShineGlass
//
//  Created by Lucifer on 13/10/20.
//  Copyright © 2020 Tecocraft. All rights reserved.
//

import UIKit
import SVPinView

class VerifyOTPVC: BaseVC {

    //#MARK:- Outlets
    @IBOutlet weak var imgvwBackground: UIImageView!
       
    @IBOutlet weak var imgvwLogo: UIImageView!
    
    @IBOutlet weak var viewContainer: UIView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var lblTitle: Medium28Black!
    
    @IBOutlet weak var txtOTP: SVPinView!
    
    @IBOutlet weak var lblOTPError: ErrorLabel!
    
    @IBOutlet weak var btnBack: UIButton!
    
    @IBOutlet weak var viewVerifyOTP: UIView!
    
    @IBOutlet weak var btnVerifyOTP: UIButton!
    
    //#MARK:- Declarations
    var strOTP = String()
    
    var loginResponse = LoginResponse(message: nil, type: nil, token: nil, user: nil, otp: nil)
    
    //#MARK:- Declarations
    let progress = Progress(totalUnitCount: 60)
    
    //#MARK:- Setup View
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        self.viewVerifyOTP.setupGrediant()
        
        self.startProgress()
    }
    
    func setupView() {
        
        self.setNeedsStatusBarAppearanceUpdate()
        
        self.view.backgroundColor = sFirstThemeBlueColor
               
        self.viewVerifyOTP.setupCornerRadius(radius: self.viewVerifyOTP.frame.height/2)
        
        self.viewContainer.setupCornerRadius(radius: 5.0)
        
        self.viewContainer.backgroundColor = sWhiteThemeColor
        
        self.viewContainer.dropShadow()
        
        self.txtOTP.pinLength = 4
        
        self.txtOTP.activeBorderLineColor = sGreyBorderColor
        
        self.txtOTP.borderLineColor = sGreyBorderColor
        
        self.txtOTP.borderLineThickness = 2.0
        
        self.txtOTP.activeBorderLineThickness = 2.0
        
        self.txtOTP.font = AppFont.size14.sMedium
        
        self.txtOTP.isContentTypeOneTimeCode = true
        
        self.txtOTP.didFinishCallback = { otp in
            
            self.strOTP = otp
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        
        return .lightContent
    }

    //#MARK:- Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    //#MARK:- Button Action
    @IBAction func handleBackAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func handleVerifyOTPAction(_ sender: Any) {
        
        if !Validator.sharedInstance.isValidEmpty(text: strOTP) {
            
            self.lblOTPError.text = TextField.errors.error.rawValue
        }
        else {
            
            self.lblOTPError.text = ""
            
            if strOTP == loginResponse.otp {
                
                UserDefaultConstant.sharedInstance.setupValue(Key: UserDefaultConstant.authKeys.allUserData.rawValue, Value: loginResponse.convertJson())
                
                UserDefaultConstant.sharedInstance.setupValue(Key: UserDefaultConstant.authKeys.userAuthToken.rawValue, Value: loginResponse.token ?? "")
                
                UserDefaultConstant.sharedInstance.setupValue(Key: UserDefaultConstant.authKeys.userData.rawValue, Value: loginResponse.user?.convertJson() ?? "")
                
                self.performSegue(withIdentifier: "showHomeVC", sender: nil)
            }
            else {
                
                self.displayErrorAlert(title: NSLocalizedString("Enter valid code!", comment: ""), popBack: false)
            }
        }
    }
    
    //#MARK:- Other Methods
    func startProgress() {
        
        self.progress.completedUnitCount = 0
        
        var values = Int(60)

        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
            
            guard self.progress.isFinished == false else {
                
                timer.invalidate()
                
                return
            }
            
            self.progress.completedUnitCount += 1
            
            values -= 1
                
            self.lblTitle.text = "Enter OTP in \(values) sec"
        }
    }
}
