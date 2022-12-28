//
//  FolderViewController.swift
//  mp4Downloader
//
//  Created by abc on 25/08/2022.
//

import Foundation

import Foundation
import UIKit

class FolderViewController: UIViewController {
    @IBOutlet weak var topView1: UIView!
    @IBOutlet weak var nav1: NavigationBar!

    override func viewDidLoad()
    {
        super.viewDidLoad()

        nav1.title = "Downloads"
        nav1.isLeftButtonHidden = true
        nav1.isRightSecondButtonHidden = true

        self.navigationController?.navigationBar.isHidden = true
        topView1.layer.cornerRadius = 35.0

    }
        
}
