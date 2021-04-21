//
//  LoginWithOTPVC.swift
//  ShineGlass
//
//  Created by Lucifer on 13/10/20.
//  Copyright © 2020 Tecocraft. All rights reserved.
//

import UIKit
import PromiseKit

class LoginWithOTPVC: BaseVC {

    //#MARK:- Outlets
    @IBOutlet weak var imgvwBackground: UIImageView!
    
    @IBOutlet weak var imgvwLogo: UIImageView!
    
    @IBOutlet weak var viewContainer: UIView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var lblTitle: Medium28Black!
    
    @IBOutlet weak var txtMobileNo: TextField!
    
    @IBOutlet weak var lblMobileNoError: ErrorLabel!
    
    @IBOutlet weak var viewGetOTP: UIView!
    
    @IBOutlet weak var btnGetOTP: UIButton!
    
    @IBOutlet weak var btnBack: UIButton!
    
    //#MARK:- Setup View
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        self.viewGetOTP.setupGrediant()
        
        self.setupTextField(txtField: self.txtMobileNo, nextField: nil, leftImage: UIImage(named: "ic_mobileno")!, errorLbl: self.lblMobileNoError, validation: .contactNumber)
    }
    
    func setupView() {
        
        self.setNeedsStatusBarAppearanceUpdate()
        
        self.view.backgroundColor = sFirstThemeBlueColor
               
        self.viewGetOTP.setupCornerRadius(radius: self.viewGetOTP.frame.height/2)
        
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
        
        if segue.identifier == "showVerifyOTPVC" {
         
            if let vc = segue.destination as? VerifyOTPVC {
                
                if let loginRes = sender as? LoginResponse {
                 
                    vc.loginResponse = loginRes
                }
            }
        }
    }
    
    //#MARK:- Button Action
    @IBAction func handleBackClick(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func handleGetOTPClick(_ sender: Any) {
        
        if !Validator.sharedInstance.isValidcontactNo(text: self.txtMobileNo.text!) {
            
            self.lblMobileNoError.text = TextField.errors.invalid.rawValue
        }
        else {
            
            self.lblMobileNoError.text = ""
            
            self.apiLoginWithOtp(params: ["mobile" : self.txtMobileNo.text ?? ""])
        }
    }
    
    //#MARK:- Api Calling
    func apiLoginWithOtp(params: [String: String]) {
        
        if Reachabilities.isConnectedToNetwork() == true {
            
            sLoaderView.startAnimating()
            
            firstly {
                
                AuthenticationManager().loginWithOTPUserApi(param: params)
                
            }
            .done{ (response) in
                
                sLoaderView.stopAnimating()
                
                if response.token != nil {
                    
                    self.performSegue(withIdentifier: "showVerifyOTPVC", sender: response)
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
extension LoginWithOTPVC: TextFieldDelegate {
    
    func textFldCheckError(txtFld: TextField) {
        
    }
    
    func textEditingEnd(txtFld: TextField) {
        
    }
    
    func changeText(txtfld: TextField) {
        
    }
    
    func textFieldValueCheckAvailability(txtfld: TextField, text: String) {
        
    }
}
