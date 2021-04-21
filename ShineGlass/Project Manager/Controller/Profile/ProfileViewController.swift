//
//  ProfileViewController.swift
//  ShineGlass
//
//  Created by dhruv dhola on 04/11/20.
//  Copyright © 2020 Tecocraft. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var logOutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
        self.setUpTableView()
    }
    
    func setUpTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        self.tableView.separatorStyle = .none
        self.nameLabel.text = "MY ACCOUNT"
        self.nameLabel.textColor = sBlackTextColor
        self.nameLabel.font = AppFont.size18.sBlack
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.logOutButton.setupGrediant()
        self.logOutButton.setupCornerRadius(radius: self.logOutButton.frame.height / 2)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func logOutButtonTapped(_ sender: UIButton) {
        
    }
    
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 0
        case 1:
            return 1
        case 2:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath) as! ProfileTableViewCell
            cell.nameValueLabel.text = "Dipesh"
            cell.emailValueLabel.text = "dipeshbhalani777@gmail.com"
            cell.phnoValueLabel.text = "+919574786816"
            cell.changePasswordButton.addTarget(self, action: #selector(changePassword(_:)), for: .touchUpInside)
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryTableViewCell", for: indexPath) as! HistoryTableViewCell
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    @objc func changePassword(_ sender: UIButton) {
        let storyBord = UIStoryboard(name: "MyAccount", bundle: nil)
        let vc = storyBord.instantiateViewController(identifier: "ChangePasswordViewController") as! ChangePasswordViewController
        vc.modalPresentationStyle = .popover
//        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 0
        case 1:
            return 300
        case 2:
            return 100
        default:
            return 0
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 2 || section == 3{
            let frame = tableView.frame
            let imageView = UIImageView(frame: CGRect(x: 10, y: 0, width: 40, height: 40))
            imageView.contentMode = .scaleAspectFit
            imageView.image = UIImage(named: "ic_history")
            let button = UIButton(frame: CGRect(x: 50, y: 0, width: 150, height: 40))
            button.setTitle("Recent Activities", for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.titleLabel?.textAlignment = .left
            button.titleLabel?.font = AppFont.size17.sMedium
            let headerView = UIView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))// create custom view
            headerView.addSubview(imageView)
            headerView.addSubview(button)   // add the button to the view
            
            return headerView
        } else {
          return nil
        }
    }
 
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 3 || section == 2 {
            return 40
        } else {
            return 0
        }
    }
}

