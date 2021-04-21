//
//  RegisterVC.swift
//  ShineGlass
//
//  Created by Lucifer on 12/10/20.
//  Copyright © 2020 Tecocraft. All rights reserved.
//

import UIKit
import PromiseKit

class RegisterVC: BaseVC {

    //#MARK:- Outlets
    @IBOutlet weak var imgvwBackground: UIImageView!
    
    @IBOutlet weak var imgvwLogo: UIImageView!
    
    @IBOutlet weak var viewContainer: UIView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var lblTitle: Medium28Black!
    
    @IBOutlet weak var txtUserName: TextField!
    
    @IBOutlet weak var lblUsernameError: ErrorLabel!
    
    @IBOutlet weak var txtEmail: TextField!
    
    @IBOutlet weak var lblEmailError: ErrorLabel!
    
    @IBOutlet weak var txtMobileNo: TextField!
    
    @IBOutlet weak var lblMobNoError: ErrorLabel!
    
    @IBOutlet weak var txtPassword: TextField!
    
    @IBOutlet weak var lblPasswordError: ErrorLabel!
    
    @IBOutlet weak var txtReEnterPassword: TextField!
    
    @IBOutlet weak var lblReEnterPassword: ErrorLabel!
    
    @IBOutlet weak var viewSignUp: UIView!
    
    @IBOutlet weak var btnSignUp: UIButton!
    
    @IBOutlet weak var btnBack: UIButton!
    
    @IBOutlet weak var lblTerms: Medium12Black!
    
    //#MARK:- Setup View
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        self.viewSignUp.setupGrediant()
        
        self.setupTextField(txtField: self.txtUserName, nextField: self.txtEmail, leftImage: UIImage(named: "ic_username")!, errorLbl: self.lblUsernameError, validation: .isEmpty)
        
        self.setupTextField(txtField: self.txtEmail, nextField: self.txtMobileNo, leftImage: UIImage(named: "ic_email")!, errorLbl: self.lblEmailError, validation: .eMail)
        
        self.setupTextField(txtField: self.txtMobileNo, nextField: self.txtPassword, leftImage: UIImage(named: "ic_mobileno")!, errorLbl: self.lblMobNoError, validation: .contactNumber)
        
        self.setupTextField(txtField: self.txtPassword, nextField: self.txtReEnterPassword, leftImage: UIImage(named: "ic_password")!, errorLbl: self.lblPasswordError, validation: .Password)
        
        self.setupTextField(txtField: self.txtReEnterPassword, nextField: nil, leftImage: UIImage(named: "ic_password")!, errorLbl: self.lblReEnterPassword, validation: .PasswordMatched)
    }
    
    func setupView() {
        
        self.setNeedsStatusBarAppearanceUpdate()
        
        self.view.backgroundColor = sFirstThemeBlueColor
        
        self.viewSignUp.setupCornerRadius(radius: self.viewSignUp.frame.height/2)
        
        self.viewContainer.setupCornerRadius(radius: 5.0)
        
        self.viewContainer.backgroundColor = sWhiteThemeColor
        
        self.viewContainer.dropShadow()
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
    
    @IBAction func btnSignUp(_ sender: Any) {
        
        if !Validator.sharedInstance.isValidEmpty(text: self.txtUserName.text!) {
            
            self.lblUsernameError.text = TextField.errors.error.rawValue
        }
            
        if !Validator.sharedInstance.isValidEmail(text: self.txtEmail.text!) {
            
            self.lblEmailError.text = TextField.errors.invalid.rawValue
        }
        
        if !Validator.sharedInstance.isValidcontactNo(text: self.txtMobileNo.text!) {
            
            self.lblMobNoError.text = TextField.errors.invalid.rawValue
        }
        
        if !Validator.sharedInstance.isValidPassword(text: self.txtPassword.text!) {
            
            self.lblPasswordError.text = TextField.errors.passError.rawValue
        }
        
        if !Validator.sharedInstance.isPasswordMatched(text: self.txtPassword.text!, passTxt: self.txtReEnterPassword.text!) {
            
            self.lblReEnterPassword.text = TextField.errors.confirmPassError.rawValue
        }
        
        if Validator.sharedInstance.isValidEmpty(text: self.txtUserName.text!) && Validator.sharedInstance.isValidEmail(text: self.txtEmail.text!) && Validator.sharedInstance.isValidcontactNo(text: self.txtMobileNo.text!) && Validator.sharedInstance.isValidPassword(text: self.txtPassword.text!) && Validator.sharedInstance.isPasswordMatched(text: self.txtPassword.text!, passTxt: self.txtReEnterPassword.text!) {
            
            self.lblUsernameError.text = ""
            
            self.lblEmailError.text = ""
            
            self.lblMobNoError.text = ""
            
            self.lblPasswordError.text = ""
            
            self.lblReEnterPassword.text = ""
            
            self.registerUser(param: ["username": self.txtUserName.text ?? "",
                                      "email": self.txtEmail.text ?? "",
                                      "password": self.txtPassword.text ?? "",
                                      "mobile": self.txtMobileNo.text ?? ""])
        }
    }
    
    //#MARK:- Api Calling
    func registerUser(param: [String: String]) {
        
        if Reachabilities.isConnectedToNetwork() == true {
            
            sLoaderView.startAnimating()
            
            firstly {
                
                AuthenticationManager().registerUserApi(param: param)
                
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
    
    //#MARK:- Other Methods
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
extension RegisterVC: TextFieldDelegate {
    
    func textFldCheckError(txtFld: TextField) {
        
    }
    
    func textEditingEnd(txtFld: TextField) {
        
        if txtFld == self.txtPassword {
            
            self.txtReEnterPassword.password = txtFld.text!
        }
    }
    
    func changeText(txtfld: TextField) {
        
    }
    
    func textFieldValueCheckAvailability(txtfld: TextField, text: String) {
        
    }
}
