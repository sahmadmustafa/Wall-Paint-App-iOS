//
//  EnterTax.swift
//  ContractorCalculator
//
//  Created by AhmadMustafa on 23/11/2022.
//

import UIKit
import Foundation

class EnterTax: UIViewController {

    @IBOutlet weak var txtfieldRate: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func calculatePressed(_ sender: UIButton)
    {
        let taxRate = Double(txtfieldRate.text!)
        UserDefaults.standard.set(taxRate, forKey: "TaxRate")  //Integer
       
        self.dismiss(animated: true)

        
    }
    @IBAction func backButtonPressed(_ sender: UIButton)
    {

        self.dismiss(animated: true)
        
    }


}

