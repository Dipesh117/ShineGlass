//
//  LoginVC.swift
//  ShineGlass
//
//  Created by Lucifer on 13/10/20.
//  Copyright © 2020 Tecocraft. All rights reserved.
//

import UIKit
import PromiseKit

class LoginVC: BaseVC {

    //#MARK:- Outlets
    @IBOutlet weak var imgvwBackground: UIImageView!
    
    @IBOutlet weak var imgvwLogo: UIImageView!
    
    @IBOutlet weak var viewContainer: UIView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var lblTitle: Medium28Black!
    
    @IBOutlet weak var txtEmail: TextField!
    
    @IBOutlet weak var lblEmailError: ErrorLabel!
    
    @IBOutlet weak var txtPassword: TextField!
    
    @IBOutlet weak var lblPasswordError: ErrorLabel!
    
    @IBOutlet weak var viewLogin: UIView!
    
    @IBOutlet weak var btnLogin: UIButton!
    
    @IBOutlet weak var btnShowPassword: UIButton!
    
    @IBOutlet weak var btnForgotPassword: UIButton!
    
    @IBOutlet weak var btnBack: UIButton!
    
    //#MARK:- Setup View
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        self.viewLogin.setupGrediant()
        
        self.setupTextField(txtField: self.txtEmail, nextField: self.txtPassword, leftImage: UIImage(named: "ic_email")!, errorLbl: self.lblEmailError, validation: .isEmpty)
        
        self.setupTextField(txtField: self.txtPassword, nextField: nil, leftImage: UIImage(named: "ic_password")!, errorLbl: self.lblPasswordError, validation: .Password)
    }
    
    func setupView() {
        
        self.setNeedsStatusBarAppearanceUpdate()
        
        self.view.backgroundColor = sFirstThemeBlueColor
               
        self.viewLogin.setupCornerRadius(radius: self.viewLogin.frame.height/2)
        
        self.viewContainer.setupCornerRadius(radius: 5.0)
        
        self.viewContainer.backgroundColor = sWhiteThemeColor
        
        self.viewContainer.dropShadow()
        
        self.btnForgotPassword.titleLabel?.font = AppFont.size14.sMedium
        
        self.btnForgotPassword.setTitleColor(sBlackTextColor, for: .normal)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        
        return .lightContent
    }
    
    //#MARK:- Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    //#MARK:- Button Action
    @IBAction func handleBackClick(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func handleLoginClick(_ sender: Any) {
        
        if !Validator.sharedInstance.isValidEmpty(text: self.txtEmail.text!) {
            
            self.lblEmailError.text = TextField.errors.error.rawValue
        }
        
        if !Validator.sharedInstance.isValidPassword(text: self.txtPassword.text!) {
            
            self.lblPasswordError.text = TextField.errors.passError.rawValue
        }
        
        if Validator.sharedInstance.isValidEmpty(text: self.txtEmail.text!) && Validator.sharedInstance.isValidPassword(text: self.txtPassword.text!) {
            
            self.lblEmailError.text = ""
            
            self.lblPasswordError.text = ""
            
            self.apiLogin(params: ["userfield": self.txtEmail.text ?? "",
                                   "password": self.txtPassword.text ?? ""])
        }
    }
    
    @IBAction func handleForgotPasswordClick(_ sender: Any) {
        
    }
    
    @IBAction func handleShowPassword(_ sender: Any) {
        
        if self.btnShowPassword.isSelected {
            
            self.btnShowPassword.isSelected = false
            
            self.txtPassword.isSecureTextEntry = true
        }
        else {
            
            self.btnShowPassword.isSelected = true
            
            self.txtPassword.isSecureTextEntry = false
        }
        
    }
    
    //#MARK:- Api Calling
    func apiLogin(params: [String: String]) {
        
        if Reachabilities.isConnectedToNetwork() == true {
            
            sLoaderView.startAnimating()
            
            firstly {
                
                AuthenticationManager().loginUserApi(param: params)
                
            }
            .done{ (response) in
                
                sLoaderView.stopAnimating()
                
                if response.token != nil {
                    
                    UserDefaultConstant.sharedInstance.setupValue(Key: UserDefaultConstant.authKeys.allUserData.rawValue, Value: response.convertJson())
                    
                    UserDefaultConstant.sharedInstance.setupValue(Key: UserDefaultConstant.authKeys.userAuthToken.rawValue, Value: response.token ?? "")
                    
                    UserDefaultConstant.sharedInstance.setupValue(Key: UserDefaultConstant.authKeys.userData.rawValue, Value: response.user?.convertJson() ?? "")
                    
                    self.performSegue(withIdentifier: "showHomeVC", sender: nil)
                }
            }
            .catch { error in
                
                sLoaderView.stopAnimating()
                
                print(error)
                
                self.displayErrorAlert(title: NSLocalizedString(error.localizedDescription, comment: ""), popBack: false)
            }
        }
        else {
            
            self.displayErrorAlert(title: NSLocalizedString(sAlertCheckInternet, comment: ""), popBack: false)
        }
    }
    
    //#MARK:- Other Method
    func setupTextField(txtField: TextField, nextField: TextField?, leftImage: UIImage, errorLbl: ErrorLabel, validation: TextField.Rules) {
        
        txtField.fieldDelegate = self
        
        txtField.nextField = nextField
        
        txtField.leftImage = leftImage
        
        txtField.errorLabel = errorLbl
        
        txtField.validationRule = validation
        
        txtField.setImageToLeft(img: leftImage)
        
        txtField.addBottomBorder()
    }
}

//#MARK:- TextField Delegate
extension LoginVC: TextFieldDelegate {
    
    func textFldCheckError(txtFld: TextField) {
        
    }
    
    func textEditingEnd(txtFld: TextField) {
        
    }
    
    func changeText(txtfld: TextField) {
        
    }
    
    func textFieldValueCheckAvailability(txtfld: TextField, text: String) {
        
    }
}
