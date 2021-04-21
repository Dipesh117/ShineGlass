//
//  HomeVC.swift
//  ShineGlass
//
//  Created by Lucifer on 21/10/20.
//  Copyright © 2020 Tecocraft. All rights reserved.
//

import UIKit
import SDWebImage
import FSPagerView
import PromiseKit
import SideMenu

class HomeVC: BaseVC {

    //#MARK:- Outlets
    @IBOutlet weak var navView: NavigationView!
    
    @IBOutlet weak var rupeeBtn: UIButton!
    
    @IBOutlet weak var walletLbl: Medium8Blue!
    
    @IBOutlet weak var myWalletBtn: UIButton!
    
    @IBOutlet weak var cardLbl: Medium8Blue!
    
    @IBOutlet weak var mycartBtn: UIButton!
    
    @IBOutlet weak var menuBtn: UIButton!
    
    @IBOutlet weak var logoImgvw: UIImageView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var pageContaiverView: UIView!
    
    @IBOutlet weak var pagerView: FSPagerView! {
        didSet {
            self.pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
            self.pagerView.decelerationDistance = 1
            self.pagerView.itemSize = FSPagerView.automaticSize
        }
    }
    
    @IBOutlet weak var rateView: UIView! {
        didSet {
            self.rateView.backgroundColor = sGreyBackgroundColor
        }
    }
    
    @IBOutlet weak var todayRateLbl: Medium10Blue!
    
    @IBOutlet weak var rightArrowImgvw: UIImageView!
    
    @IBOutlet weak var rate1Lbl: SemiBold10Black!
    
    @IBOutlet weak var speratorLbl1: UILabel! {
        didSet {
            self.speratorLbl1.backgroundColor = sGreySeperatorColor
        }
    }
    
    @IBOutlet weak var rate2Lbl: SemiBold10Black!
    
    @IBOutlet weak var speratorLbl2: UILabel! {
        didSet {
            self.speratorLbl2.backgroundColor = sGreySeperatorColor
        }
    }
    
    @IBOutlet weak var rate3Lbl: SemiBold10Black!
    
    @IBOutlet weak var titleLbl: Medium22Black!
    
    @IBOutlet weak var clearGlassView: UIView!
    
    @IBOutlet weak var clearGlassImgvw: UIImageView!
    
    @IBOutlet weak var clearGlassLbl: Medium8White!
    
    @IBOutlet weak var reflectingView: UIView!
    
    @IBOutlet weak var reflectingImgvw: UIImageView!
    
    @IBOutlet weak var reflectingGlassLbl: Medium8White!
    
    @IBOutlet weak var tintedView: UIView!
    
    @IBOutlet weak var tintedImgvw: UIImageView!
    
    @IBOutlet weak var tintedLbl: Medium8White!
    
    @IBOutlet weak var highReflectingView: UIView!
    
    @IBOutlet weak var highReflectingImgvw: UIImageView!
    
    @IBOutlet weak var highReflectingLbl: Medium8White!
    
    @IBOutlet weak var lacqueredView: UIView!
    
    @IBOutlet weak var lacqueredImgvw: UIImageView!
    
    @IBOutlet weak var lacqueredLbl: Medium8White!
    
    @IBOutlet weak var mirrorView: UIView!
    
    @IBOutlet weak var mirrorImgvw: UIImageView!
    
    @IBOutlet weak var mirrorLbl: Medium8White!
    
    @IBOutlet weak var subtitleLbl: Medium14Black!
    
    @IBOutlet weak var uploadImageView: UIView!
    
    @IBOutlet weak var uploadImageBtn: UIButton! {
        didSet {
            
            self.uploadImageBtn.setTitleColor(sGreyTextColor, for: .normal)
            
            self.uploadImageBtn.titleLabel?.font = AppFont.size16.sDINBold
        }
    }
    
    //#MARK:- Declarations
    var arrBannerImg = [BannerResponse]()
    
    var arrCategories = [CategoryResponse]()
    
    var strCategory = String()
    
    //#MARK:- Setup View
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupView()
    }
    
    func setupView() {
        
        self.setNeedsStatusBarAppearanceUpdate()
        
        self.view.backgroundColor = sWhiteThemeColor
        
        self.rupeeBtn.setTitleColor(sFirstThemeBlueColor, for: .normal)
        
        self.pagerView.delegate = self
        
        self.pagerView.dataSource = self
        
        self.clearGlassLbl.backgroundColor = sBlueClearGlassColor
        
        self.reflectingGlassLbl.backgroundColor = sRedReflectiveColor
        
        self.tintedLbl.backgroundColor = sGreenTintedColor
        
        self.highReflectingLbl.backgroundColor = sBlueHighReflectiveColor
        
        self.lacqueredLbl.backgroundColor = sOrangeLacqueredColor
        
        self.mirrorLbl.backgroundColor = sGreenMirrorColor
        
        self.uploadImageView.backgroundColor = sLightPurpelBackgroundColor
        
        self.view.layoutIfNeeded()
        
        self.uploadImageView.setupDashedBorder(dashWidth: 1.0, borderColor: sFirstThemeBlueColor, dashLength: 5.0, betweenDashesSpace: 2.5, cornerRadius: 2.0)
        
        self.apiGetBannerImages()
        
        self.apiGetCategoriesData()
        
        self.apiGetRatesData()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        
        return .darkContent
    }

    //#MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "presentSideMenu" {
            
            guard let sideMenuNavigationController = segue.destination as? SideMenuNavigationController else { return }
            
            sideMenuNavigationController.modalPresentationStyle = .overFullScreen
            
            sideMenuNavigationController.settings = CustomFunction().makeSettings()
        }
        else if segue.identifier == "showGlassCategoriesVC" {
            
            guard let vc = segue.destination as? GlassCategoriesVC else { return }
            
            if let arrCat = sender as? [SubcategoryResponse] {
                
                vc.arrCategory = arrCat
                
                vc.strTitle = self.strCategory
            }
        }
        else if segue.identifier == "showMeasurementVC" {
            
            guard let vc = segue.destination as? MeasurementVC else { return }
            
            vc.strTitle = self.strCategory
        }
    }
    
    //#MARK:- Button Action
    @IBAction func handleMyWalletClick(_ sender: Any) {
        
    }
    
    @IBAction func handleMyCartClick(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Cart", bundle: nil)
        let vc = storyBoard.instantiateViewController(identifier: "CartViewController") as! CartViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func handleCategoryClick(_ sender: UIButton) {
        
        switch sender.tag {
        case 101:
            
            // Clear Glass
            self.strCategory = "CLEAR GLASS"
            
            let category = self.arrCategories.filter({ $0.name == self.strCategory })
            
            if category.count > 0 {
                
                self.performSegue(withIdentifier: "showGlassCategoriesVC", sender: category[0].subcategory)
            }
            else {
                
                self.performSegue(withIdentifier: "showMeasurementVC", sender: nil)
            }
            
            break
            
        case 102:
        
            // Reflective Glass
            self.strCategory = "REFLECTIVE GLASS"
            
            let category = self.arrCategories.filter({ $0.name == self.strCategory })
            
            if category.count > 0 {
                
                self.performSegue(withIdentifier: "showGlassCategoriesVC", sender: category[0].subcategory)
            }
            else {
                
                self.performSegue(withIdentifier: "showMeasurementVC", sender: nil)
            }
            
            break
            
        case 103:
        
            // Tinted Glass
            self.strCategory = "TINTED GLASS"
            
            let category = self.arrCategories.filter({ $0.name == self.strCategory })
            
            if category.count > 0 {
                
                self.performSegue(withIdentifier: "showGlassCategoriesVC", sender: category[0].subcategory)
            }
            else {
                
                self.performSegue(withIdentifier: "showMeasurementVC", sender: nil)
            }
            
            break
            
        case 104:
        
            // High Reflective Glass
            self.strCategory = "HIGH REFLECTIVE GLASS"
            
            let category = self.arrCategories.filter({ $0.name == self.strCategory })
            
            if category.count > 0 {
                
                self.performSegue(withIdentifier: "showGlassCategoriesVC", sender: category[0].subcategory)
            }
            else {
                
                self.performSegue(withIdentifier: "showMeasurementVC", sender: nil)
            }
            
            break
            
        case 105:
        
            // Lacquered Glass
            self.strCategory = "LACQUERED GLASS"
            
            let category = self.arrCategories.filter({ $0.name == self.strCategory })
            
            if category.count > 0 {
                
                self.performSegue(withIdentifier: "showGlassCategoriesVC", sender: category[0].subcategory)
            }
            else {
                
                self.performSegue(withIdentifier: "showMeasurementVC", sender: nil)
            }
            
            break
            
        default:
            
            // Mirror
            self.strCategory = "MIRROR"
            
            let category = self.arrCategories.filter({ $0.name == self.strCategory })
            
            if category.count > 0 {
                
                self.performSegue(withIdentifier: "showGlassCategoriesVC", sender: category[0].subcategory)
            }
            else {
                
                self.performSegue(withIdentifier: "showMeasurementVC", sender: nil)
            }
            
            break
        }
    }
    
    //#MARK:- Api Calling
    func apiGetBannerImages() {
        
        if Reachabilities.isConnectedToNetwork() == true {
            
            sLoaderView.startAnimating()
            
            firstly {
                
                HomeManager().getBannerImages()
                
            }
            .done{ (response) in
                
                sLoaderView.stopAnimating()
                
                if response.count > 0 {
                    
                    self.arrBannerImg = response
                    
                    self.pagerView.reloadData()
                }
                else {
                    
                    self.displayErrorAlert(title: "Banner images not found", popBack: false)
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
    
    func apiGetCategoriesData() {
        
        if Reachabilities.isConnectedToNetwork() == true {
            
            sLoaderView.startAnimating()
            
            firstly {
                
                HomeManager().getCategories()
                
            }
            .done{ (response) in
                
                sLoaderView.stopAnimating()
                
                if response.count > 0 {
                    
                    self.arrCategories = response
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
    
    func apiGetRatesData() {
        
        if Reachabilities.isConnectedToNetwork() == true {
            
            sLoaderView.startAnimating()
            
            firstly {
                
                HomeManager().getRates()
                
            }
            .done{ (response) in
                
                sLoaderView.stopAnimating()
                
                if response.count > 0 {
                    
                    let rates = response[0]
                        
                    self.rate1Lbl.text = "\(rates.name ?? "0")=Rs \(rates.rate ?? "0")"
                }
                
                if response.count > 1 {
                    
                    let rates = response[1]
                        
                    self.rate2Lbl.text = "\(rates.name ?? "0")=Rs \(rates.rate ?? "0")"
                }
                
                if response.count > 2 {
                    
                    let rates = response[2]
                        
                    self.rate3Lbl.text = "\(rates.name ?? "0")=Rs \(rates.rate ?? "0")"
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

//#MARK:- FSPagerDelegate
extension HomeVC: FSPagerViewDelegate, FSPagerViewDataSource {
    
    public func numberOfItems(in pagerView: FSPagerView) -> Int {
        
        return self.arrBannerImg.count
    }
    
    public func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        
        cell.imageView?.contentMode = .scaleAspectFill
        
        cell.imageView?.clipsToBounds = true
        
        cell.imageView?.setupImage(image: sImageURL + (self.arrBannerImg[index].url ?? ""))
        
        return cell
    }
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        
        pagerView.deselectItem(at: index, animated: true)
        
        pagerView.scrollToItem(at: index, animated: true)
    }
}
