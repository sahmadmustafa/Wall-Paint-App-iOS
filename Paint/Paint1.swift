

import Foundation

import UIKit

class Colors {
    var gl:CAGradientLayer!

    init() {
//        let colorTop = UIColor(red: 192.0 / 255.0, green: 38.0 / 255.0, blue: 42.0 / 255.0, alpha: 1.0).cgColor
//        let colorBottom = UIColor(red: 35.0 / 255.0, green: 2.0 / 255.0, blue: 2.0 / 255.0, alpha: 1.0).cgColor

        
        let colorTop = UIColor(red: 155.0 / 255.0, green: 150.0 / 255.0, blue: 70.0 / 255.0, alpha: 1.0).cgColor
        
        let colorBottom = UIColor(red: 255.0 / 255.0, green: 142.0 / 255.0, blue: 42.0 / 255.0, alpha: 1.0).cgColor

//        let colorTop = UIColor.yellow.cgColor
//        let colorBottom = UIColor.green.cgColor

        self.gl = CAGradientLayer()
        self.gl.colors = [colorTop, colorBottom]
        self.gl.locations = [0.0, 1.0]
    }
}


class Paint1: UIViewController {

    //MARK:- ViewController Outlets
    
    var strIndex: String!
    
    @IBOutlet var imageView: UIImageView!

    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!


    //MARK:- ViewController state varibles
    private var screenSize = CGSize.zero
    private var cameraToggled = false
    private var applyPaint = true
    private var currentColor = UIColor.red
    
    var colorPicker: ChromaColorPicker!
    
    
   
   
//    - (void)viewWillAppear:(BOOL)animated
//    {
//        [super viewWillAppear:animated];
//
//    self.na
//
//    }
    
    
    //MARK:- Lifecycle Hooks
   
   
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
//    override func viewWi
//    {
//    }
    
    
//    - (void)viewWillAppear:(BOOL)animated
    
    override func viewWillLayoutSubviews()
    {
        button1.layer.cornerRadius=5.0
        button2.layer.cornerRadius=5.0

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
        
        /*
    
        let alert = UIAlertController(title: "Logout", message: "Would you like to continue Logout?", preferredStyle: UIAlertController.Style.alert)

            // add the actions (buttons)
            alert.addAction(UIAlertAction(title: "Logout", style: UIAlertAction.Style.default, handler: { action in
//                print("Yay! You brought your towel!")
             
                let storyboard = UIStoryboard(name: "Main", bundle: nil)

//                [[NSUserDefaults standardUserDefaults]setObject:@"YES" forKey:@"loggedin"];
                UserDefaults.standard.set("NO", forKey: "loggedin") //setObject

                
                let loginVC = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
                let window = UIApplication.shared.windows.first

                // Embed loginVC in Navigation Controller and assign the Navigation Controller as windows root
                let nav = UINavigationController(rootViewController: loginVC!)
                window?.rootViewController = nav
            
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))

            // show the alert
            self.present(alert, animated: true, completion: nil)
    
 
 */
        /*
         
         let loginVC = self.storyboard?.instantiateViewController(withIdentifier: LoginViewController.className) as? LoginViewController
         let window = UIApplication.shared.windows.first

         // Embed loginVC in Navigation Controller and assign the Navigation Controller as windows root
         let nav = UINavigationController(rootViewController: loginVC)
         window?.rootViewController = nav
         
         */
        
        
    }
    
//    override func viewwill
//    {
//        super.viewDidLoad()
//
//    }
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden=true

    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        print("success")
        
        self.navigationController?.navigationBar.isHidden=true
        
        let defaults = UserDefaults.standard
        defaults.set(nil, forKey: "SavedStringArray")
        
        
        
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
    
 

}
