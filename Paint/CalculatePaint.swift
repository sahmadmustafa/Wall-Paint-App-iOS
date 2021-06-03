//
//  CalculatePaint.swift
//  Paint
//
//  Created by Apple on 4/23/21.
//  Copyright © 2021 Hot Cocoa Software. All rights reserved.
//

import Foundation

import UIKit

class CalculatePaint: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var selectCategory: IQDropDownTextField!
    
    @IBOutlet var feldFirstName: UITextField!
    @IBOutlet var feldLastName: UITextField!
    @IBOutlet var feldQuadrameterMeter: UITextField!
    @IBOutlet var feldAddress: UITextView!
    @IBOutlet var feldPhone: UITextField!
    @IBOutlet var feldEmail: UITextField!

    
    let cellReuseIdentifier = "CellNew"
    @IBOutlet var tableView: UITableView!

    //MARK:- ViewController Outlets
    
    var strValueHex: String!
    
    @IBOutlet var scrolVw: UIScrollView!

    @IBOutlet var ViewColor: UIView!

    @IBOutlet var colorCode: UITextField!

    @IBOutlet var imageView: UIImageView!

    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!


    //MARK:- ViewController state varibles
    private var screenSize = CGSize.zero
    private var cameraToggled = false
    private var applyPaint = true
    private var currentColor = UIColor.red
    
    var colorPicker: ChromaColorPicker!
    
    
   
    
    //MARK:- Lifecycle Hooks
   
    func UIColorFromRGB(_ rgbValue: Int) -> UIColor! {
        return UIColor(
            red: CGFloat((Float((rgbValue & 0xff0000) >> 16)) / 255.0),
            green: CGFloat((Float((rgbValue & 0x00ff00) >> 8)) / 255.0),
            blue: CGFloat((Float((rgbValue & 0x0000ff) >> 0)) / 255.0),
            alpha: 1.0)
    }
    @IBAction func openCamera(_ sender: UIBarButtonItem)
    {
        //PHOTO 1 Button
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let objRestuarantReviewsViewController = storyboard.instantiateViewController(withIdentifier: "PaintViewController") as? PaintViewController
    
        objRestuarantReviewsViewController?.strIndex="1"

        if let aController = objRestuarantReviewsViewController
        {
            navigationController?.pushViewController(aController, animated: true)
        }
        
        
        
    }
    @IBAction func openGallery(_ sender: UIBarButtonItem)
    {
        //PHOTO 2 Button
                
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let objRestuarantReviewsViewController = storyboard.instantiateViewController(withIdentifier: "PaintViewController") as? PaintViewController
        
            objRestuarantReviewsViewController?.strIndex="2"

            if let aController = objRestuarantReviewsViewController
            {
                self.navigationController?.pushViewController(aController, animated: true)
            }

        
        
        
    }
    
    @IBAction func CancelButton(_ sender: UIBarButtonItem)
    {
        self.navigationController?.popViewController(animated: true)
//        ViewPopup.isHidden=true
    }
    @IBAction func SendButton(_ sender: UIBarButtonItem)
    {
//        ViewPopup.isHidden=true
        Kaka()
    }
  
    
    func Kaka()
    {
        FTIndicator.showProgress(withMessage: "")
//        FTIndi
        let strUrl1 = "http://webapi.malerei-linz.com/api/auth/addpaintinquiry"
//        let encoded = (strUrl1 as NSString).addingPercentEscapes(using: String.Encoding.utf8.rawValue)
        /*
        [[
            "code":"1",
            "color_name":"Biologische Farbe"
            ],[
            "code":"45",
            "color_name":"Biologische Farbe"
            ],[
            "code":"4354",
            "color_name":"Biologische Farbe"
            ]]
        */
        
        let parameters1 = ["phone":feldPhone.text!,
                           "email" : feldEmail.text!,"firstname":feldFirstName.text!,"lastname":feldLastName.text!,"address":feldAddress.text!,"square_meter":feldQuadrameterMeter.text!,"colors":[[
                "code":"1",
                "name":"red"
                ]]
            
        ] as [String : Any]
        

        //        NSURL *url = [NSURL URLWithString:strUrl1];
        let manager2 = AFHTTPSessionManager(sessionConfiguration: URLSessionConfiguration.default)
        manager2.requestSerializer = AFJSONRequestSerializer()
        
        manager2.requestSerializer.setValue("application/json", forHTTPHeaderField: "Content-Type")

        manager2.post(strUrl1, parameters: parameters1, headers: nil, progress: nil, success: { task, responseObject in
            
            print(responseObject! as Any)
            
            let dic:NSDictionary=responseObject! as! NSDictionary
            let str:String=dic["message"]! as! String
            FTIndicator.showSuccess(withMessage: str)
        
            self.navigationController?.popToRootViewController(animated: true)

            
            
        }, failure: { task, error in

            print(error.localizedDescription)
            print("FailedFailedFailedFailedFailedFailedFailedFailedFailedFailed")
            FTIndicator.showError(withMessage: "Fill all fields correctly")
        })
        
        
    }
    
    override func viewWillLayoutSubviews()
    {
//        button1.layer.cornerRadius=5.0
//        button2.layer.cornerRadius=5.0

    }
    
    
    @IBAction func showLogOutTapped(_ sender: UIButton) {

            // create the alert
//            let alert = UIAlertController(title: "Logout", message: "If you want to Logout, Press Logout button", preferredStyle: UIAlertController.Style.alert)
//
//            // add an action (button)
//            alert.addAction(UIAlertAction(title: "Logout", style: UIAlertAction.Style.default, handler: nil))
//
//            // show the alert
//            self.present(alert, animated: true, completion: nil)
        
    
        let alert = UIAlertController(title: "Logout", message: "Would you like to continue Logout?", preferredStyle: UIAlertController.Style.alert)

            // add the actions (buttons)
            alert.addAction(UIAlertAction(title: "Logout", style: UIAlertAction.Style.default, handler: nil))
            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))

            // show the alert
            self.present(alert, animated: true, completion: nil)
    
    }
    
//    override func viewwill
//    {
//        super.viewDidLoad()
//
//    }
    
    
    @IBAction func doneClicked(_ sender: Any)
    {
//        selectCategory.resignFirstResponder()
        let tag = ((sender as AnyObject).tag)!
        let index = IndexPath(row: tag, section: 0)
        let cell = tableView.cellForRow(at: index)
    
        let selectCategory1 = cell!.viewWithTag(5)

        selectCategory1!.resignFirstResponder()
        
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        print("success")
        
//
//        let toolbar = UIToolbar()
////        toolbar.setBarStyle(UIBarStyle.default)
//        toolbar.sizeToFit()
//        let buttonflexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
//        let buttonDone = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneClicked(_:)))
//
//        toolbar.items = [buttonflexible, buttonDone]
//        selectCategory.inputAccessoryView = toolbar
////        selectCategory.dropDownMode = IQDropDownModeTextPicker
//        selectCategory.isOptionalDropDown = false
//        selectCategory.itemList = ["Aries", "Taurus", "Gemini", "Cancer", "Leo", "Virgo", "Libra", "Scorpio", "Sagittarius", "Capricorn", "Aquarius", "Pisces"]
//
        //
        
        
        
        
        self.title="Contact Form"
        self.navigationController?.navigationBar.isHidden=false
        
        scrolVw.clipsToBounds=true
        scrolVw.contentSize=CGSize(width: scrolVw.frame.size.width, height: 777)
//        scrolVw.contentSize=CGSize(width: self.view.frame.size.width, height: 777)
//        ViewColor.backgroundColor=self.UIColorFromRGB(strValueHex)
        
//        let testString = strValueHex
//        var testStringReplacedOccurences = testString!.replacingOccurrences(of: "#",
//                                                                           with: "0x")

//        ViewColor.backgroundColor=UIColorFromRGB(Int(strValueHex)!)

        
//        let color = UIColor(hexString: strValueHex)
//        ViewColor.backgroundColor=color
//
//        colorCode.text=strValueHex
        
        colorPicker = ChromaColorPicker(frame: CGRect(x: view.frame.width/2 - 140, y: view.frame.height/2 - 270, width: 300, height: 300))
//        colorPicker.delegate = self //ChromaColorPickerDelegate
        colorPicker.padding = 5
        colorPicker.stroke = 3
        colorPicker.currentColor = currentColor
        colorPicker.hexLabel.textColor = currentColor
               
        colorPicker.isHidden = true
        view.addSubview(colorPicker)
        
        
        let colors = Colors()

        view.backgroundColor = UIColor.clear
        var backgroundLayer = colors.gl
        backgroundLayer!.frame = view.frame
        view.layer.insertSublayer(backgroundLayer!, at: 0)

        
        
//         func refresh() {
//               view.backgroundColor = UIColor.clearColor()
//               var backgroundLayer = colors.gl
//               backgroundLayer.frame = view.frame
//               view.layer.insertSublayer(backgroundLayer, atIndex: 0)
//             }
           
        
        
        
  
    }
    
//    func getGallery()
//    {
//
//        cameraToggled = false
//        getPhoto()
//
//    }
    
 
    //MARK:- TABLE VIEW DELEGATES
    
    
    @IBAction func ClosePopUp(_ sender: UIBarButtonItem)
    {
     //   ViewPopup.isHidden=true
    }
    
    // number of rows in table view
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
//        return self.SavedArray.count
        let defaults = UserDefaults.standard
        let myarray = defaults.stringArray(forKey: "SavedStringArray") ?? [String]()
//        print(myarray)
        if(myarray==nil)
        {
            return 0

        }
        else
        {
        return myarray.count
        }
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        // create a new cell if needed or reuse an old one
//        let cell:UITableViewCell = (self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell?)!
        
        
        
        let cell:UITableViewCell = (self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell?)!

        let view:UIView = cell.viewWithTag(1)!
        let label1:UILabel = cell.viewWithTag(2) as! UILabel
        view.backgroundColor=UIColor.blue
        label1.text="#hger"
        
        let defaults = UserDefaults.standard
        let myarray = defaults.stringArray(forKey: "SavedStringArray") ?? [String]()
//        print(myarray)
        let str:String = myarray[indexPath.row]
        label1.text = str

        let color = UIColor(hexString: str)
        view.backgroundColor=color

//     if((cell.viewWithTag(5) as! IQDropDownTextField)!=nil)
//     {
        let selectCategory1:IQDropDownTextField = cell.viewWithTag(5) as! IQDropDownTextField

        
        
//        let toolbar = UIToolbar()
//        toolbar.sizeToFit()
//        let buttonflexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
//        let buttonDone = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneClicked(_:)))
//
//        toolbar.items = [buttonflexible, buttonDone]
//        selectCategory1.inputAccessoryView = toolbar
//        selectCategory.dropDownMode = IQDropDownModeTextPicker
        selectCategory1.isOptionalDropDown = false
        selectCategory1.itemList = ["Biologische Farbe", "Mineral Farbe", "Kalk Farbe", "Latex Farbe"]
        
//        selectCategory1.tag=indexPath.row
        
       
        
        
//        cell.textLabel?.text = self.SavedArray[indexPath.row]
//        cell.textLabel?.text = "frerwf"
        return cell
        
        
    
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        print("You tapped cell number \(indexPath.row).")
        /*
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let obj = storyboard.instantiateViewController(withIdentifier: "HistoryDetail") as? HistoryDetail
        
        
        obj?.store=self.SavedArray[indexPath.row]
        
        self.navigationController?.pushViewController(obj!, animated: true)
        */
        
        
    }

    
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 78.0
//  }
  
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

    return 78.0
    }
    
//    cell.txtTimeSheet.keyboardToolbar.doneBarButton.setTarget(self, action: #selector(doneButtonClicked))
    
    
    @IBAction func minusTapped(_ sender:AnyObject) {
        let buttonPosition:CGPoint = sender.convert(CGPoint.zero, to:self.tableView)
        let indexPath = self.tableView.indexPathForRow(at: buttonPosition)
        print(indexPath?.row)
        
        let defaults = UserDefaults.standard
        var myarray = defaults.stringArray(forKey: "SavedStringArray") ?? [String]()

        myarray.remove(at: indexPath!.row)
        
        
//        let defaults = UserDefaults.standard
        defaults.set(myarray, forKey: "SavedStringArray")

        tableView.reloadData()
        
        
    }
    
    
}

extension UIColor {
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        return String(format:"#%06x", rgb)
    }
}
