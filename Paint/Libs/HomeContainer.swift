//
//  HomeContainer.swift
//  mp4Downloader
//
//  Created by abc on 23/08/2022.
//

import Foundation
import UIKit

class HomeContainer: UITableViewController {
    @IBOutlet weak var topView1: UIView!
    @IBOutlet weak var topView2: UIView!
    @IBOutlet weak var topView3: UIView!
    @IBOutlet weak var topView4: UIView!
    @IBOutlet weak var topView5: UIView!
    @IBOutlet weak var topView6: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        topView1.layer.cornerRadius = 35.0
        topView2.layer.cornerRadius = 35.0
        topView3.layer.cornerRadius = 35.0
        topView4.layer.cornerRadius = 35.0
        topView5.layer.cornerRadius = 35.0
        topView6.layer.cornerRadius = 35.0

    }
    
    @IBAction func didTapWhatsappStatus(_ sender: Any)
    {
        
    let vc = self.storyboard?.instantiateViewController(identifier: "WhatsappStatusVC") as! WhatsappStatusVC
    self.navigationController?.pushViewController(vc, animated: true)
        
    }

}
