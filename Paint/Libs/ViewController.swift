//
//  ViewController.swift
//  mp4Downloader
//
//  Created by sid on 7/29/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var topView2: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        topView.layer.cornerRadius = 35.0
        topView2.layer.cornerRadius = 35.0

        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        topView2.addGestureRecognizer(tap)
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        print("Tap----")
    }
    
//    override func vie

}

