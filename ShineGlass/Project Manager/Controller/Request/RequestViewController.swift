//
//  RequestViewController.swift
//  ShineGlass
//
//  Created by dhruv dhola on 30/10/20.
//  Copyright © 2020 Tecocraft. All rights reserved.
//

import UIKit
import SideMenu
import PromiseKit

class RequestViewController: BaseVC {

    //#MARK:- Outlets
    @IBOutlet weak var navView: NavigationView!
    
    @IBOutlet weak var rupeeBtn: UIButton!
    
    @IBOutlet weak var walletLbl: Medium8Blue!
    
    @IBOutlet weak var myWalletBtn: UIButton!
    
    @IBOutlet weak var cardLbl: Medium8Blue!
    
    @IBOutlet weak var mycartBtn: UIButton!
    
    @IBOutlet weak var menuBtn: UIButton!
    
    @IBOutlet weak var logoImgvw: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var requestLabel: SemiBold18Black!
    
    //#MARK:- Declarations
    
    
    //#MARK:- Setup View
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.setUpView()
    }
    
    func setUpView() {
        
        self.view.backgroundColor = sWhiteThemeColor
        
        self.rupeeBtn.setTitleColor(sFirstThemeBlueColor, for: .normal)
        
        self.tableView.delegate = self
        
        self.tableView.dataSource = self
        
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        self.requestLabel.text = ""
    }

    
    override func viewWillAppear(_ animated: Bool) {
        self.requestApiCall(params: [:])
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
    
    func requestApiCall(params: [String: String]) {
        
        if Reachabilities.isConnectedToNetwork() == true {
            
            sLoaderView.startAnimating()
            
            firstly {
                
                AuthenticationManager().requestApiCall(param: [:])
                
            }
            .done{ (response) in
                
                sLoaderView.stopAnimating()
                
                if !response.isEmpty {
                    print("successfully")
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

}

extension RequestViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RequestTableViewCell", for: indexPath) as! RequestTableViewCell
        
        cell.requestNoLabel.text = "REQUEST NO:"
        
        cell.requestNoLabel.textColor = sGreyTextColor
        
        cell.requestNoLabel.font = AppFont.size12.sRegular
        
        cell.dateLabel.text = "DATE:"
        
        cell.dateLabel.textColor = sGreyTextColor
        
        cell.dateLabel.font = AppFont.size12.sRegular
        
        cell.requestValueLabel.text = "16050687945894"
        
        cell.requestValueLabel.textColor = sBlackTextColor
        
        cell.requestValueLabel.font = AppFont.size14.sBold
        
        cell.dateValueLabel.text = "30-10-2020"
        
        cell.dateValueLabel.textColor = sBlackTextColor
        
        cell.dateValueLabel.font = AppFont.size14.sBold
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
