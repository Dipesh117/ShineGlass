//
//  SideMenuTVC.swift
//  ShineGlass
//
//  Created by Lucifer on 03/11/20.
//  Copyright © 2020 Tecocraft. All rights reserved.
//

import UIKit

class SideMenuTVC: UITableViewController {

    //#MARK:- Setup View
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupView()
    }
    
    func setupView() {
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        self.tableView.tableFooterView = UIView()
    }

    //#MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}

//#MARK:- TableView Delegate and DataSource
extension SideMenuTVC {

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.selectionStyle = .default
        
        
        switch indexPath.row {
        case 0:
            
            cell.textLabel?.text = "About Us"
            
            break
            
        case 1:
            
            cell.textLabel?.text = "Facebook"
            
            break
            
        case 2:
            
            cell.textLabel?.text = "Terms & Policies"
            
            break
            
        default:
            
            cell.textLabel?.text = "Help/Contact Us"
            
            break
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.dismiss(animated: true, completion: nil)
    }
}
