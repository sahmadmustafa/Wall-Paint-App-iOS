//
//  ViewController.swift
//  ContractorCalculator
//
//  Created by AhmadMustafa on 04/11/2022.
//

import UIKit
import Foundation

class CalcViewController: UIViewController {

    @IBOutlet weak var Labor: UITextField!
    @IBOutlet weak var Material: UITextField!

    @IBOutlet weak var Subtotal: UILabel!
    @IBOutlet weak var Tax: UILabel!
    @IBOutlet weak var Total: UILabel!

    
    @IBOutlet weak var currentTaxRate: UILabel!
    @IBOutlet weak var TaxRate: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    //    self.navigationController?.isNavigationBarHidden = false
       
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(named: "themePrimaryColor")
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationItem.standardAppearance = appearance
        self.navigationItem.scrollEdgeAppearance = appearance

        
        
        let alert = UIAlertController(title: "Contractor Calculator", message: "You can now calculate total cost with contractor with Tax Rates.Here we provide users to apply different Tax Rates to cost so this may help you to take cost effective measurements", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    @IBAction func shareTextButton(_ sender: UIButton) {
            
            // text to share
        let text = Subtotal.text! + "\n" + Tax.text! + "\n" + Total.text!
            
            // set up activity view controller
            let textToShare = [ text ]
            let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
            
            // exclude some activity types from the list (optional)
            activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook ]
            
            // present the view controller
            self.present(activityViewController, animated: true, completion: nil)
            
        }
    override func viewWillLayoutSubviews() {

        var taxRatePercentage:Double = UserDefaults.standard.double(forKey: "TaxRate")
        
        if(taxRatePercentage == 0.0)
        {
            taxRatePercentage = 6.0
            
            
            currentTaxRate.text = String(format: "Current Tax Rate:%f%", 6.0)
        }
        else
        {
            
            currentTaxRate.text = String(format: "Current Tax Rate:%.2f%", taxRatePercentage)

            
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

      
    
    }
    
    
    
    
    @IBAction func calculatePressed(_ sender: UIButton)
    {
        
        var taxRatePercentage:Double = UserDefaults.standard.double(forKey: "TaxRate")
        taxRatePercentage = taxRatePercentage/100
        
        if(taxRatePercentage == 0.0)
        {
            taxRatePercentage = 0.06
        }
        
        var labor1:Float = Float(Labor.text!) ?? 0.0
        var material1:Float = Float(Material.text!) ?? 0.0
        
        var subtotal1:Float = labor1 + material1
        
        Subtotal.text = String(format: "SubTotal:    %.2f", subtotal1)
        var tax1:Float = (subtotal1 * Float(taxRatePercentage))
        Tax.text = String(format: "Tax:    %.2f", tax1)
        
        var total1:Float = tax1 + subtotal1
        Total.text = String(format: "Total:    %.2f", total1)

        
    }


}

