//
//  BaseVC.swift
//  ShineGlass
//
//  Created by Lucifer on 19/10/20.
//  Copyright © 2020 Tecocraft. All rights reserved.
//

import UIKit
import PromiseKit
import SideMenu
import NVActivityIndicatorView

class BaseVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        window?.addSubview(sLoaderView)
        
        sLoaderView.backgroundColor = sBlackBackgroundColor.withAlphaComponent(0.6)
    }
    
    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    //#MARK:- Alert
    func displayErrorAlert(title: String, popBack: Bool) {
        
        // create the alert
        let alert = UIAlertController(title: title, message: "", preferredStyle: UIAlertController.Style.alert)
        
        if (popBack == true) {
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                
                self.navigationController?.popViewController(animated: true)
            }))
        }
        else {
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil))
        }
        
        self.present(alert, animated: true, completion: nil)
    }
}
