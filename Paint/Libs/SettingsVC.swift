//
//  File.swift
//  ByteDex
//
//  Created by Hassan Bhatti on 28/10/2021.
//

import UIKit

class SettingsVC: UIViewController {

    // MARK:- Outlets
    
    var isSearching = false
    @IBOutlet weak var topView: UIView!

    @IBOutlet weak var nav1: NavigationBar!

   
    override func viewDidLoad()
    {
        super.viewDidLoad()

        nav1.title = "SETTINGS"
        nav1.isLeftButtonHidden = true
        nav1.isRightSecondButtonHidden = true

//        self.title="More"
        self.navigationController?.navigationBar.isHidden = true
        // Do any additional setup after loading the view.
    
        topView.layer.cornerRadius = 35.0

    
    }
    
    /**
      It will hide bottom tabbar
     */
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
        self.navigationController?.navigationBar.isHidden = true

    
    }

    /**
      It will show bottom tabbar
     */
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    

    

    // MARK:- UI Actions
    
  
    @IBAction func didTapAbout(_ sender: Any)
    {
//        if #available(iOS 13.0, *) {
//            let vc = self.storyboard?.instantiateViewController(identifier: BuyBitcoinVCC.className) as! BuyBitcoinVCC
//            self.navigationController?.pushViewController(vc, animated: true)
//
//        } else {
//            // Fallback on earlier versions
//        }

    }
    
   
    
    /**
      It will move to previous screen
     */
    @IBAction func didTapBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //PreferencesVC
  

}



