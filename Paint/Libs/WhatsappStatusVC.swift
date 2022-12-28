//
//  WhatsappStatusVC.swift
//  mp4Downloader
//
//  Created by abc on 25/08/2022.
//

import Foundation

import UIKit

class WhatsappStatusVC: UIViewController {
//    @IBOutlet weak var topView: UIView!
//    @IBOutlet weak var topView2: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        topView.layer.cornerRadius = 35.0
//        topView2.layer.cornerRadius = 35.0
//
//        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
//        topView2.addGestureRecognizer(tap)
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        print("Tap----")
    }
    
    @IBAction func didTapBack(_ sender: Any)
        {
            self.navigationController?.popViewController(animated: true)
    
            }
//    override func vie

}

