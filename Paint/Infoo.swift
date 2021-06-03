//
//  Infoo.swift
//  Paint app StoryboardUI
//
//  Created by Apple on 4/22/21.
//  Copyright © 2021 Hot Cocoa Software. All rights reserved.
//

import Foundation
import UIKit




class Infoo: UITableViewController
{
 
    
    @IBOutlet var View1: UIView!

    
//    override func viewWillAppear(ani)
//    {
////        super.viewDidLoad()
//
//        let colors = Colors()
//
//       // view.backgroundColor = UIColor.clear
//        var backgroundLayer = colors.gl
//        backgroundLayer!.frame = view.frame
//        self.view.layer.insertSublayer(backgroundLayer!, at: 0)
//
//
//    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
    
//        self.navigationController?.navigationBar.isHidden=true

        
//
        let colors = Colors()

       // view.backgroundColor = UIColor.clear
        var backgroundLayer = colors.gl
        backgroundLayer!.frame = view.frame
        self.view.layer.insertSublayer(backgroundLayer!, at: 3)
        
    
        

        
        
        
        
//        self.view.backgroundColor.gl=colors.gl
        
    }
    
    
//    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
//        cell.backgroundColor = UIColor.clear
//    }
    
    
}
