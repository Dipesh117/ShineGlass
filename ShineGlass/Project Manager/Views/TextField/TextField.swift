//
//  TextField.swift
//  ShineGlass
//
//  Created by Lucifer on 12/10/20.
//  Copyright © 2020 Tecocraft. All rights reserved.
//

import UIKit
import Foundation

@objc protocol TextFieldDelegate {
    func textEditingEnd(txtFld: TextField)
    func textFldCheckError(txtFld: TextField)
    func changeText(txtfld: TextField)
    @objc optional func textFieldValueCheckAvailability(txtfld: TextField, text: String)
}

class TextField: UITextField, UITextFieldDelegate {
    
    public var errorLabel : ErrorLabel?
    
    public var currentVC: UIViewController?
    
    public var password = String()
    
    public var nextField : TextField?
    
    public var leftImage : UIImage?
    
    var fieldDelegate : TextFieldDelegate?
    
    var valid = Validator.sharedInstance
    
    var emailAreadyExistsCheck = false
    
    var usernameAreadyExistsCheck = false
    
    public var validationRule = Rules.none
    
    public enum Rules {
        case Password
        case eMail
        case PostCode
        case FirstName
        case Surname
        case Username
        case City
        case Address
        case Country
        case County
        case PasswordMatched
        case isEmpty
        case birthDate
        case contactNumber
        case pin
        case pinMatched
        case Decimal
        case affiliateCode
        case none
    }
    
    public enum errors : String {
        case invalid = "Invalid"
        case mini2Charater = "Must be between 2 and 20 characters"
        case usernameError = "Must be between 5 and 40 characters"
        case postCodeError = "Postcode is not valid"
        case error = "This field is required"
        case confirmPassError = "Password not match"
        case passError = "At least 8 chars, 1 upper char and 1 number"
        case confirmPinError = "Pin not match"
        case pinError = "Pin required and needs to be 4 digits"
        case affiliateCodeError = "Must be between 0 and 32 characters"
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        self.delegate = self
        
        self.textContentType = .init(rawValue: "")
        
        self.backgroundColor = sWhiteThemeColor
        
        self.textColor = sLightBlackTextColor
        
        self.font = AppFont.size12.sMedium
        
        self.setColorPlaceHolder(color: sLightBlackTextColor)
        
//        self.addBottomBorder()
        
        self.addTarget(self, action: #selector(self.changeText(fld:)), for: .editingChanged)
    }
    
    
    func updateErrors(errorLbl:UILabel?, txtFld: TextField?, value: Bool, errorStr: String) {
        
        if value {
            
            if errorLabel != nil {
                
                errorLbl!.text = nil
                
                errorLbl!.isHidden = true
                
                currentVC?.view.layoutIfNeeded()
            }
            
        }
        else {
            
            if errorLabel != nil {
                
                errorLbl!.text = errorStr
                
                errorLbl!.isHidden = false
                
                currentVC?.view.layoutIfNeeded()
            }
        }
    }
    
    //#MARK:- Action
    @objc func changeText(fld: TextField){
        
        fieldDelegate?.changeText(txtfld: fld)
    }
    
    //#MARK:- Add Bottom Border
    func addBottomBorder() {
        
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: self.frame.height - 1, width: self.frame.width, height: 1.0)
        bottomLine.backgroundColor = sGreyBottomBorderColor.cgColor
        self.borderStyle = UITextField.BorderStyle.none
        self.layer.addSublayer(bottomLine)
    }
    
    //#MARK:- Delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if self.nextField != nil {
            self.nextField!.becomeFirstResponder()
        }
        if textField.returnKeyType == .done {
            self.resignFirstResponder()
            currentVC?.view.endEditing(true)
        }
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        let text = textField.text?.removeWhitespace()
        
        fieldDelegate?.textEditingEnd(txtFld: self)
        switch validationRule {
        case .Address:
            
            let value = valid.isValidAddress(text: text ?? "")
            self.updateErrors(errorLbl: errorLabel, txtFld: self, value: value, errorStr: NSLocalizedString(errors.error.rawValue, comment: ""))
            fieldDelegate?.textFldCheckError(txtFld: self)
            
        case .eMail:
            
            if !emailAreadyExistsCheck {
                
                let value = valid.isValidEmail(text: text ?? "")
                self.updateErrors(errorLbl: errorLabel, txtFld: self, value: value, errorStr: NSLocalizedString(errors.invalid.rawValue, comment: ""))
                
            }
            fieldDelegate?.textFldCheckError(txtFld: self)
            
        case .City:
            let value = valid.isValidCity(text: text ?? "")
            self.updateErrors(errorLbl: errorLabel, txtFld: self, value: value, errorStr: NSLocalizedString(errors.error.rawValue, comment: ""))
            
            fieldDelegate?.textFldCheckError(txtFld: self)
            
        case .Country:
            let value = valid.isValidCounty(text: text ?? "")
            self.updateErrors(errorLbl: errorLabel, txtFld: self, value: value, errorStr: NSLocalizedString(errors.error.rawValue, comment: ""))
            
            fieldDelegate?.textFldCheckError(txtFld: self)
            
        case .County :
            let value = valid.isValidCounty(text: text ?? "")
            self.updateErrors(errorLbl: errorLabel, txtFld: self, value: value, errorStr: NSLocalizedString(errors.error.rawValue, comment: ""))
            
            fieldDelegate?.textFldCheckError(txtFld: self)
            
        case .isEmpty :
            var value = true
            if self.text == "" {
                value = false
            }
            self.updateErrors(errorLbl: errorLabel, txtFld: self, value: value, errorStr: NSLocalizedString(errors.error.rawValue, comment: ""))
            
            fieldDelegate?.textFldCheckError(txtFld: self)
            
        case .FirstName :
            let value = valid.isValidFirstName(text: text ?? "")
            self.updateErrors(errorLbl: errorLabel, txtFld: self, value: value, errorStr: NSLocalizedString(errors.mini2Charater.rawValue, comment: ""))
            
            fieldDelegate?.textFldCheckError(txtFld: self)
            
        case .Password :
            
            let value = valid.isValidPassword(text: text ?? "")
            self.updateErrors(errorLbl: errorLabel, txtFld: self, value: value, errorStr: NSLocalizedString(errors.passError.rawValue, comment: ""))
            
            fieldDelegate?.textFldCheckError(txtFld: self)
            
        case .PasswordMatched :
            
            let value = valid.isPasswordMatched(text: text ?? "", passTxt: password)
            self.updateErrors(errorLbl: errorLabel, txtFld: self, value: value, errorStr: NSLocalizedString(errors.confirmPassError.rawValue, comment: ""))
            
            fieldDelegate?.textFldCheckError(txtFld: self)
            
        case .PostCode :
            let value = valid.isValidPostCode(text: text ?? "")
            self.updateErrors(errorLbl: errorLabel, txtFld: self, value: value, errorStr: NSLocalizedString(errors.postCodeError.rawValue, comment: ""))
            
            fieldDelegate?.textFldCheckError(txtFld: self)
            
        case .Surname :
            let value = valid.isValidSurName(text: text ?? "")
            self.updateErrors(errorLbl: errorLabel, txtFld: self, value: value, errorStr: NSLocalizedString(errors.mini2Charater.rawValue, comment: ""))
            
            fieldDelegate?.textFldCheckError(txtFld: self)
            
            
        case .Username :
            
            
            if !usernameAreadyExistsCheck {
                let value = valid.isValidUserName(text: text ?? "")
                self.updateErrors(errorLbl: errorLabel, txtFld: self, value: value, errorStr: NSLocalizedString(errors.usernameError.rawValue, comment: ""))
            }
            
            
            fieldDelegate?.textFldCheckError(txtFld: self)
            
            
        case .birthDate :
            let value = valid.isValidBirthdate(text: text ?? "")
            self.updateErrors(errorLbl: errorLabel, txtFld: self, value: value, errorStr: NSLocalizedString(errors.error.rawValue, comment: ""))
            
            fieldDelegate?.textFldCheckError(txtFld: self)
            
        case .contactNumber :
            let value = valid.isValidcontactNo(text: text ?? "")
            self.updateErrors(errorLbl: errorLabel, txtFld: self, value: value, errorStr: NSLocalizedString(errors.invalid.rawValue, comment: ""))
            
            fieldDelegate?.textFldCheckError(txtFld: self)
            
        case .pin :
            var value = true
            if (self.text ?? "").count < 4 {
                value = false
            }
            self.updateErrors(errorLbl: errorLabel, txtFld: self, value: value, errorStr: NSLocalizedString(errors.pinError.rawValue, comment: ""))
            
            
        case .pinMatched :
            let value = valid.isPasswordMatched(text: text ?? "", passTxt: password)
            self.updateErrors(errorLbl: errorLabel, txtFld: self, value: value, errorStr: NSLocalizedString(errors.confirmPinError.rawValue, comment: ""))
            
            fieldDelegate?.textFldCheckError(txtFld: self)
            
        case .affiliateCode:
            
            let value = valid.isValidAffiliateCode(text: text ?? "")
            self.updateErrors(errorLbl: errorLabel, txtFld: self, value: value, errorStr: NSLocalizedString(errors.affiliateCodeError.rawValue, comment: ""))
            
            fieldDelegate?.textFldCheckError(txtFld: self)
            
            
        default:
            
//            print("")
            break

        }
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
         return true
        
        /*
        let  char = string.cString(using: String.Encoding.utf8)!
        var checkText = textField.text!
        let isBackSpace = strcmp(char, "\\b")
        if (isBackSpace == -92) {
            checkText = String(checkText.dropLast())
        }else {
            checkText = NSString(string: textField.text!).replacingCharacters(in: range, with: string)
        }
        
        switch validationRule {
        case .Address:
            let value = valid.isValidAddress(text: checkText)
            self.updateErrors(errorLbl: errorLabel, txtFld: self, value: value, errorStr: NSLocalizedString(errors.error.rawValue, comment: ""))
            
            fieldDelegate?.textFldCheckError(txtFld: self)
            
        case .eMail:
            let value = valid.isValidEmail(text: checkText)
            self.updateErrors(errorLbl: errorLabel, txtFld: self, value: value, errorStr: NSLocalizedString(errors.invalid.rawValue, comment: ""))
            
            fieldDelegate?.textFldCheckError(txtFld: self)
            
            if (value == true) {
                fieldDelegate?.textFieldValueCheckAvailability?(txtfld: self, text: checkText)
            }
            
        case .City:
            let value = valid.isValidCity(text: checkText)
            self.updateErrors(errorLbl: errorLabel, txtFld: self, value: value, errorStr: NSLocalizedString(errors.error.rawValue, comment: ""))
            
            fieldDelegate?.textFldCheckError(txtFld: self)
            
        case .Country:
            let value = valid.isValidCountry(text: checkText)
            self.updateErrors(errorLbl: errorLabel, txtFld: self, value: value, errorStr: NSLocalizedString(errors.error.rawValue, comment: ""))
            
            fieldDelegate?.textFldCheckError(txtFld: self)
            
        case .County :
            let value = valid.isValidCounty(text: checkText)
            self.updateErrors(errorLbl: errorLabel, txtFld: self, value: value, errorStr: NSLocalizedString(errors.error.rawValue, comment: ""))
            
            fieldDelegate?.textFldCheckError(txtFld: self)
            
        case .isEmpty :
            var value = false
            if self.text == "" {
                value = true
            }
            self.updateErrors(errorLbl: errorLabel, txtFld: self, value: value, errorStr: NSLocalizedString(errors.error.rawValue, comment: ""))
            
            fieldDelegate?.textFldCheckError(txtFld: self)
            
        case .FirstName :
            let value = valid.isValidFirstName(text: checkText)
            self.updateErrors(errorLbl: errorLabel, txtFld: self, value: value, errorStr: NSLocalizedString(errors.mini2Charater.rawValue, comment: ""))
            
            fieldDelegate?.textFldCheckError(txtFld: self)
            
        case .Password :
            let value = valid.isValidPassword(text: checkText)
            self.updateErrors(errorLbl: errorLabel, txtFld: self, value: value, errorStr: NSLocalizedString(errors.passError.rawValue, comment: ""))
            
            fieldDelegate?.textFldCheckError(txtFld: self)
            
        case .PasswordMatched :
            let value = valid.isPasswordMatched(text: checkText, passTxt: password)
            self.updateErrors(errorLbl: errorLabel, txtFld: self, value: value, errorStr: NSLocalizedString(errors.confirmPassError.rawValue, comment: ""))
            
            fieldDelegate?.textFldCheckError(txtFld: self)
            
        case .PostCode :
            let value = valid.isValidPostCode(text: checkText)
            self.updateErrors(errorLbl: errorLabel, txtFld: self, value: value, errorStr: NSLocalizedString(errors.postCodeError.rawValue, comment: ""))
            
            fieldDelegate?.textFldCheckError(txtFld: self)
            
        case .Surname :
            let value = valid.isValidSurName(text: checkText)
            self.updateErrors(errorLbl: errorLabel, txtFld: self, value: value, errorStr: NSLocalizedString(errors.mini2Charater.rawValue, comment: ""))
            
            fieldDelegate?.textFldCheckError(txtFld: self)
            
            
        case .Username :
            let value = valid.isValidUserName(text: checkText)
            self.updateErrors(errorLbl: errorLabel, txtFld: self, value: value, errorStr: NSLocalizedString(errors.usernameError.rawValue, comment: ""))
            
            fieldDelegate?.textFldCheckError(txtFld: self)
            if (value == true) {
                
                fieldDelegate?.textFieldValueCheckAvailability?(txtfld: self, text: checkText)
            }
            
        case .birthDate :
            let value = valid.isValidBirthdate(text: checkText)
            self.updateErrors(errorLbl: errorLabel, txtFld: self, value: value, errorStr: NSLocalizedString(errors.error.rawValue, comment: ""))
            
            fieldDelegate?.textFldCheckError(txtFld: self)
            
        case .contactNumber :
            let value = valid.isValidcontactNo(text: checkText)
            self.updateErrors(errorLbl: errorLabel, txtFld: self, value: value, errorStr: NSLocalizedString(errors.invalid.rawValue, comment: ""))
            
            fieldDelegate?.textFldCheckError(txtFld: self)
            
        case .pin :
            var value = true
            if checkText.count < 4 {
                value = false
            }
            self.updateErrors(errorLbl: errorLabel, txtFld: self, value: value, errorStr: NSLocalizedString(errors.pinError.rawValue, comment: ""))
            fieldDelegate?.textFldCheckError(txtFld: self)
            return self.text!.count + (string.count - range.length) <= 4
            
        case .pinMatched :
            let value = valid.isPasswordMatched(text: checkText, passTxt: password)
            self.updateErrors(errorLbl: errorLabel, txtFld: self, value: value, errorStr: NSLocalizedString(errors.confirmPinError.rawValue, comment: ""))
            
            fieldDelegate?.textFldCheckError(txtFld: self)
            return self.text!.count + (string.count - range.length) <= 4;
            
        case .Decimal:
            
            let components = checkText.components(separatedBy: ".")
            
            if components.count == 2
            {
                if components[1].count >= 3
                {
                    return false
                }
            }
            
        case .affiliateCode:
            
            let value = valid.isValidAffiliateCode(text: checkText )
            self.updateErrors(errorLbl: errorLabel, txtFld: self, value: value, errorStr: NSLocalizedString(errors.affiliateCodeError.rawValue, comment: ""))
            
            if value == true {
            
                fieldDelegate?.textFieldValueCheckAvailability?(txtfld: self, text: checkText)
            }
            else {
                
                fieldDelegate?.textFldCheckError(txtFld: self)
            }
            
            
        default:
            print("")
        }
        */
    }
}
