//
//  GlassCategoriesVC.swift
//  ShineGlass
//
//  Created by Lucifer on 03/11/20.
//  Copyright © 2020 Tecocraft. All rights reserved.
//

import UIKit

class GlassCategoriesVC: UIViewController {

    //#MARK:- Outlets
    @IBOutlet weak var viewNav: UIView!
    
    @IBOutlet weak var imgvwBackNav: UIImageView!
    
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var navTitleLbl: SemiBold18Black!
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var titleLbl: SemiBold18Black!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //#MARK:- Declarations
    var arrCategory = [SubcategoryResponse]()
    
    var strTitle = String()
    
    //#MARK:- Setup View
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupView()
    }
    
    func setupView() {
        
        self.setNeedsStatusBarAppearanceUpdate()
        
        self.view.backgroundColor = sFirstThemeBlueColor
        
        self.viewNav.backgroundColor = sWhiteThemeColor
        
        self.navTitleLbl.text = self.strTitle
        
        self.navTitleLbl.textColor = sWhiteThemeColor
        
        self.containerView.backgroundColor = sWhiteThemeColor
        
        self.collectionView.backgroundColor = sWhiteThemeColor
        
        self.collectionView.register(UINib(nibName: "GlassCategoryCVCell", bundle: nil), forCellWithReuseIdentifier: "GlassCategoryCVCell")
        
        self.collectionView.delegate = self
        
        self.collectionView.dataSource = self
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        
        return .lightContent
    }
    
    //#MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showMeasurementVC" {
            
            guard let vc = segue.destination as? MeasurementVC else { return }
            
            if let name = sender as? String {
                
                vc.strSubTitle = name
                
                vc.strTitle = self.strTitle
            }
        }
    }
    
    //#MARK:- Button Action
    @IBAction func handleBackClick(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
}

//#MARK:- CollectionView Delegate and DataSource
extension GlassCategoriesVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.arrCategory.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GlassCategoryCVCell", for: indexPath) as! GlassCategoryCVCell
        
        cell.setupCellData(title: self.arrCategory[indexPath.item].name ?? "")
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width/2.0, height: SCREEN_WIDTH/6.8)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "showMeasurementVC", sender: self.arrCategory[indexPath.item].name)
    }
}
