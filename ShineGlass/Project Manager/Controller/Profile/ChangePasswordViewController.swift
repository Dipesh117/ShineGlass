//
//  ChangePasswordViewController.swift
//  ShineGlass
//
//  Created by dhruv dhola on 08/11/20.
//  Copyright © 2020 Tecocraft. All rights reserved.
//

import UIKit

class ChangePasswordViewController: BaseVC, TextFieldDelegate {
    
    @IBOutlet weak var changePasswordLabel: UILabel!
    @IBOutlet weak var enterOldPasswordTextField: TextField!
    @IBOutlet weak var enterNewPasswordTextField: TextField!
    @IBOutlet weak var reEnterNewPasswordTextField: TextField!
    @IBOutlet weak var changeButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var oldPasswordHideShowButton: UIButton!
    @IBOutlet weak var newPasswordHideShowButton: UIButton!
    @IBOutlet weak var confirmPasswordHideShowButton: UIButton!
    @IBOutlet weak var oldPasswordErrorLabel: ErrorLabel!
    @IBOutlet weak var newPasswordErrorLabel: ErrorLabel!
    @IBOutlet weak var confirmPasswordErrorLabel: ErrorLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.setupView()
    }
    
    
    func setupView() {
        
        self.setNeedsStatusBarAppearanceUpdate()
        
        //        self.view.backgroundColor = sFirstThemeBlueColor
        self.changeButton.setupCornerRadius(radius: self.changeButton.frame.height/2)
        
        self.changeButton.setupGrediant()
        
        //        self.viewContainer.setupCornerRadius(radius: 5.0)
        //
        //        self.viewContainer.backgroundColor = sWhiteThemeColor
        //
        //        self.viewContainer.dropShadow()
        
        self.changeButton.setTitle("CHANGE", for: .normal)
        
        self.cancelButton.setTitle("CANCEL", for: .normal)
        
        self.changeButton.titleLabel?.font = AppFont.size14.sMedium
        
        self.cancelButton.titleLabel?.font = AppFont.size14.sMedium
        
        self.changeButton.setTitleColor(.white, for: .normal)
        
        self.cancelButton.setTitleColor(sBlackTextColor, for: .normal)
        
        self.cancelButton.setupBorderWithCornerRadius(borderWidth: 0.5, borderColor: sBlueHighReflectiveColor, cornerRadius: self.cancelButton.frame.height/2)
        
        self.changePasswordLabel.text = "CHANGE PASSWORD"
        self.changePasswordLabel.font = AppFont.size14.sDINBold
        self.changePasswordLabel.numberOfLines = 0

        self.setupTextField(txtField: self.enterOldPasswordTextField, nextField: self.enterNewPasswordTextField, leftImage: UIImage(named: "ic_change_lock")!, errorLbl: self.oldPasswordErrorLabel, validation: .isEmpty)
        
        self.setupTextField(txtField: self.enterNewPasswordTextField, nextField: self.reEnterNewPasswordTextField, leftImage: UIImage(named: "ic_change_key")!, errorLbl: self.newPasswordErrorLabel, validation: .Password)
        
        self.setupTextField(txtField: self.reEnterNewPasswordTextField, nextField: self.enterOldPasswordTextField, leftImage: UIImage(named: "ic_change_key")!, errorLbl: self.confirmPasswordErrorLabel, validation: .PasswordMatched)
        
    }
    
    func setupTextField(txtField: TextField, nextField: TextField?, leftImage: UIImage, errorLbl: ErrorLabel, validation: TextField.Rules) {
        
        txtField.fieldDelegate = self
        
        txtField.nextField = nextField
        
        txtField.leftImage = leftImage
        
        txtField.errorLabel = errorLbl
        
        txtField.validationRule = validation
        
        txtField.setImageToLeft(img: leftImage)
        
        txtField.addBottomBorder()
    }
    
    
    func textEditingEnd(txtFld: TextField) {
        
    }
    
    func textFldCheckError(txtFld: TextField) {
        
    }
    
    func changeText(txtfld: TextField) {
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    
    @IBAction func oldPasswordHideShowButton(_ sender: UIButton) {
        if self.oldPasswordHideShowButton.isSelected {
            
            self.oldPasswordHideShowButton.isSelected = false
            
            self.enterOldPasswordTextField.isSecureTextEntry = true
        }
        else {
            
            self.oldPasswordHideShowButton.isSelected = true
            
            self.enterOldPasswordTextField.isSecureTextEntry = false
        }
    }
    
    @IBAction func newPasswordHideShowButton(_ sender: UIButton) {
        if self.newPasswordHideShowButton.isSelected {
            
            self.newPasswordHideShowButton.isSelected = false
            
            self.enterNewPasswordTextField.isSecureTextEntry = true
        }
        else {
            
            self.newPasswordHideShowButton.isSelected = true
            
            self.enterNewPasswordTextField.isSecureTextEntry = false
        }
    }
    
    @IBAction func confirmPasswordHideShowButton(_ sender: UIButton) {
        if self.confirmPasswordHideShowButton.isSelected {
            
            self.confirmPasswordHideShowButton.isSelected = false
            
            self.reEnterNewPasswordTextField.isSecureTextEntry = true
        }
        else {
            
            self.confirmPasswordHideShowButton.isSelected = true
            
            self.reEnterNewPasswordTextField.isSecureTextEntry = false
        }
    }
    
    @IBAction func changeButton(_ sender: UIButton) {
        
    }
    
    @IBAction func cancelButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
