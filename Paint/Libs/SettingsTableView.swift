//
//  SettingsTableView.swift
//  ByteDex
//
//  Created by Hassan Bhatti on 28/10/2021.
//

import Foundation

import UIKit


class SettingsTableView: UITableViewController{
    @IBOutlet weak var switchDarkMode: UISwitch!

    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true

    
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()

//        self.title="More"
        self.navigationController?.navigationBar.isHidden = true
        // Do any additional setup after loading the view.
    
    
    
    }

//    @IBAction func didTapNotification(_ sender: Any)
//    {
//
//        if #available(iOS 13.0, *) {
//            let vc = self.storyboard?.instantiateViewController(identifier: "NotificationSettingsVC") as! NotificationSettingsVC
//            self.navigationController?.pushViewController(vc, animated: true)
//
//        } else {
//            // Fallback on earlier versions
//        }
//
//    }
//
//@IBAction func didTapAbout(_ sender: Any)
//{
//    //AboutVC
//    if #available(iOS 13.0, *) {
//        let vc = self.storyboard?.instantiateViewController(identifier: AboutVC.className) as! AboutVC
//        self.navigationController?.pushViewController(vc, animated: true)
//
//    } else {
//        // Fallback on earlier versions
//    }
//
//}
//
//    //PriceAlertVC
//    @IBAction func didTapPriceAlert(_ sender: Any)
//    {
//        if #available(iOS 13.0, *) {
//            let vc = self.storyboard?.instantiateViewController(identifier: PriceAlertVC.className) as! PriceAlertVC
//            self.navigationController?.pushViewController(vc, animated: true)
//
//        } else {
//            // Fallback on earlier versions
//        }
//
//    }
//
//    @IBAction func didTapPreferences(_ sender: Any)
//    {
//        if #available(iOS 13.0, *) {
//            let vc = self.storyboard?.instantiateViewController(identifier: PreferencesVC.className) as! PreferencesVC
//            self.navigationController?.pushViewController(vc, animated: true)
//
//        } else {
//            // Fallback on earlier versions
//        }
//
//    }
//
//    //WalletsListVC
//    @IBAction func MainWallet(_ sender: Any)
//    {
//        if #available(iOS 13.0, *) {
//            let vc = self.storyboard?.instantiateViewController(identifier: "WalletsListVC") as! WalletsListVC
//            self.navigationController?.pushViewController(vc, animated: true)
//
//        } else {
//            // Fallback on earlier versions
//        }
//    }
//
//    //PrivacyPolicyWallet
//    @IBAction func PrivacyPolicyWallet(_ sender: Any)
//    {
//        if #available(iOS 13.0, *) {
//            let vc = self.storyboard?.instantiateViewController(identifier: "SettingsWebView") as! SettingsWebView
//            vc.selectionIndex = 1
//            self.navigationController?.pushViewController(vc, animated: true)
//
//        } else {
//            // Fallback on earlier versions
//        }
//    }
//
//    @IBAction func HelpCentreWallet(_ sender: Any)
//    {
//        if #available(iOS 13.0, *) {
//            let vc = self.storyboard?.instantiateViewController(identifier: "SettingsWebView") as! SettingsWebView
//            vc.selectionIndex = 2
//            self.navigationController?.pushViewController(vc, animated: true)
//
//        } else {
//            // Fallback on earlier versions
//        }
//    }
//    @IBAction func TwitterWallet(_ sender: Any)
//    {
//        if #available(iOS 13.0, *) {
//            let vc = self.storyboard?.instantiateViewController(identifier: "SettingsWebView") as! SettingsWebView
//            vc.selectionIndex = 3
//            self.navigationController?.pushViewController(vc, animated: true)
//
//        } else {
//            // Fallback on earlier versions
//        }
//    }
//    @IBAction func TelegramWallet(_ sender: Any)
//    {
//        if #available(iOS 13.0, *) {
//            let vc = self.storyboard?.instantiateViewController(identifier: "SettingsWebView") as! SettingsWebView
//            vc.selectionIndex = 4
//            self.navigationController?.pushViewController(vc, animated: true)
//
//        } else {
//            // Fallback on earlier versions
//        }
//    }
//
//    @IBAction func FacebookWallet(_ sender: Any)
//    {
//        if #available(iOS 13.0, *) {
//            let vc = self.storyboard?.instantiateViewController(identifier: "SettingsWebView") as! SettingsWebView
//            vc.selectionIndex = 5
//            self.navigationController?.pushViewController(vc, animated: true)
//
//        } else {
//            // Fallback on earlier versions
//        }
//    }
    
    
    @IBAction func changeApperanaceMode(_ sender: Any)
    {
        
        if(switchDarkMode.isOn==true)
        {
            if #available(iOS 13.0, *) {
                let sceneDelegate = UIApplication.shared.connectedScenes
                    .first!.delegate as! SceneDelegate
                sceneDelegate.window!.overrideUserInterfaceStyle = .dark
                if #available(iOS 13.0, *) {
                    let sceneDelegate = UIApplication.shared.connectedScenes
                        .first!.delegate as! SceneDelegate
                } else {
                    // Fallback on earlier versions
                }     }
        else
        {
            if #available(iOS 13.0, *) {
                let sceneDelegate = UIApplication.shared.connectedScenes
                    .first!.delegate as! SceneDelegate
                sceneDelegate.window!.overrideUserInterfaceStyle = .light

            } else {
                // Fallback on earlier versions
            }

            

        }
            
    }
        else
        {
            if #available(iOS 13.0, *) {
                let sceneDelegate = UIApplication.shared.connectedScenes
                    .first!.delegate as! SceneDelegate
                sceneDelegate.window!.overrideUserInterfaceStyle = .light

            } else {
                // Fallback on earlier versions
            }
        }
    }
    @IBAction func actionSecurity(_ sender: Any)
    {
//            if #available(iOS 13.0, *) {
//                let vc = self.storyboard?.instantiateViewController(identifier: "AppLockVC") as! AppLockVC
//                self.navigationController?.pushViewController(vc, animated: true)
//
//            } else {
//                // Fallback on earlier versions
//            }

        
    }

}
