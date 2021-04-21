//
//  CartViewController.swift
//  ShineGlass
//
//  Created by dhruv dhola on 05/11/20.
//  Copyright © 2020 Tecocraft. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {

    @IBOutlet weak var cartTableView: UITableView!
    @IBOutlet weak var cartPdfTableView: UITableView!
    @IBOutlet weak var cartLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var requestButton: UIButton!
    @IBOutlet weak var imageLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.setUpView()
    }
    
    func setUpView() {
        self.cartPdfTableView.delegate = self
        self.cartPdfTableView.dataSource = self
        self.cartPdfTableView.tableFooterView = UIView(frame: CGRect.zero)
        self.cartPdfTableView.separatorStyle = .none
        self.cartTableView.delegate = self
        self.cartTableView.dataSource = self
        self.cartTableView.tableFooterView = UIView(frame: CGRect.zero)
        self.cartTableView.separatorStyle = .none
        self.cartLabel.text = "MY CART"
        self.cartLabel.textColor = .black
        self.cartLabel.font = AppFont.size17.sDINMedium
        self.imageLabel.text = "IMAGES/PDF UPLOADED"
        self.imageLabel.font = AppFont.size17.sDINMedium
        self.imageLabel.textColor = .black
        self.requestButton.setupGrediant()
        self.requestButton.setTitleColor(.white, for: .normal)
        self.requestButton.setupCornerRadius(radius: self.requestButton.frame.height / 2)
        self.requestButton.setTitle("REQUEST QUOTATION", for: .normal)
        self.cartTableView.showsVerticalScrollIndicator = false
        self.cartPdfTableView.showsVerticalScrollIndicator = false
       // self.addRightImage(image: UIImage(named: "ic_login")!, offset: 0)
    }
        
    
    override func viewDidAppear(_ animated: Bool) {

    }
    
    func addRightImage(image: UIImage, offset: CGFloat) {
        self.requestButton.setImage(image, for: .normal)
        self.requestButton.imageView?.translatesAutoresizingMaskIntoConstraints = false
        self.requestButton.imageView?.centerYAnchor.constraint(equalTo: self.requestButton.centerYAnchor, constant: 0.0).isActive = true
        self.requestButton.imageView?.trailingAnchor.constraint(equalTo: self.requestButton.trailingAnchor, constant: 0.0).isActive = true
        self.requestButton.imageView?.contentMode = .scaleAspectFit
        self.requestButton.imageView?.tintColor = .white
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func requestButton(_ sender: UIButton) {
        
    }

}

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.cartTableView {
            return 1
        } else if tableView == self.cartPdfTableView {
            return 2
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == self.cartTableView {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartTableViewCell", for: indexPath) as! CartTableViewCell
        return cell
        } else if tableView == self.cartPdfTableView {
          let cell = tableView.dequeueReusableCell(withIdentifier: "CartPdfTableViewCell", for: indexPath) as! CartPdfTableViewCell
          return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == self.cartTableView {
            return 300
        } else if tableView == self.cartPdfTableView {
            return 100
        } else {
            return 0
        }
    }
}
