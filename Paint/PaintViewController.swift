

import UIKit
import CropViewController



class PaintViewController: UIViewController,UITableViewDelegate, UITableViewDataSource
{
    
    let cellReuseIdentifier = "CellNew"
    @IBOutlet var tableView: UITableView!
    @IBOutlet var ViewPopup: UIView!

    
    var array:NSMutableArray=[]
    private let imageView99 = UIImageView()
    
    private var image99: UIImage?
    private var croppingStyle = CropViewCroppingStyle.default
    
    private var croppedRect = CGRect.zero
    private var croppedAngle = 0

    
    
    //MARK:- ViewController Outlets
    
    var strIndex: String!
    
    @IBOutlet var imageView: UIImageView!
    var image11: UIImage!

    @IBOutlet var BtnCalculate: UIButton!

    
    //MARK:- ViewController state varibles
    private var touchX = 0.0
    private var touchY = 0.0
    private var screenSize = CGSize.zero
    private var cameraToggled = false
    private var applyPaint = true
    private var currentColor = UIColor.red
    
    var colorPicker: ChromaColorPicker!
    
    private var imagePickerVC: UIImagePickerController {
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        return vc
    }
    
    static func UIColorFromRGB(_ rgbValue: Int) -> UIColor! {
        return UIColor(
            red: CGFloat((Float((rgbValue & 0xff0000) >> 16)) / 255.0),
            green: CGFloat((Float((rgbValue & 0x00ff00) >> 8)) / 255.0),
            blue: CGFloat((Float((rgbValue & 0x0000ff) >> 0)) / 255.0),
            alpha: 1.0)
    }
    
   
    
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden=true

        ViewPopup.isHidden=true

    }
    
    public func layoutImageView()
    {
        guard imageView.image != nil else { return }
        
        let padding: CGFloat = 20.0
        
        var viewFrame = self.view.bounds
        viewFrame.size.width -= (padding * 2.0)
        viewFrame.size.height -= ((padding * 2.0))
        
        var imageFrame = CGRect.zero
        imageFrame.size = imageView.image!.size;
        
        if imageView.image!.size.width > viewFrame.size.width || imageView.image!.size.height > viewFrame.size.height {
            let scale = min(viewFrame.size.width / imageFrame.size.width, viewFrame.size.height / imageFrame.size.height)
            imageFrame.size.width *= scale
            imageFrame.size.height *= scale
            imageFrame.origin.x = (self.view.bounds.size.width - imageFrame.size.width) * 0.5
            imageFrame.origin.y = (self.view.bounds.size.height - imageFrame.size.height) * 0.5
            imageView.frame = imageFrame
        }
        else {
            self.imageView.frame = imageFrame;
            self.imageView.center = CGPoint(x: self.view.bounds.midX, y: self.view.bounds.midY)
        }
    }
      //MARK:- ViewControllers Action methods
    @IBAction func Refresh(_ sender: UIBarButtonItem)
    {
//        image11 = image
        imageView.image = image11

    }

    //print(colorPicker.hexLabel.text!)
    @IBAction func submitCalculate(_ sender: UIBarButtonItem)
    {
        
        colorPicker.isHidden = true

        let defaults = UserDefaults.standard
        let myarray = defaults.stringArray(forKey: "SavedStringArray") ?? [String]()
        print(myarray)
        
        
        
        print(colorPicker.hexLabel.text!)
 
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let objRestuarantReviewsViewController = storyboard.instantiateViewController(withIdentifier: "CalculatePaint") as? CalculatePaint
    
 
        
        objRestuarantReviewsViewController?.strValueHex=colorPicker.hexLabel.text!

        if let aController = objRestuarantReviewsViewController
        {
            navigationController?.pushViewController(aController, animated: true)
        }
    }
    @IBAction func Calculate(_ sender: UIBarButtonItem)
    {
        colorPicker.isHidden=true
        ViewPopup.isHidden=false

        tableView.reloadData()
//
//
//        let defaults = UserDefaults.standard
//        let myarray = defaults.stringArray(forKey: "SavedStringArray") ?? [String]()
//        print(myarray)
//
//
//
//        print(colorPicker.hexLabel.text!)
//
//
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let objRestuarantReviewsViewController = storyboard.instantiateViewController(withIdentifier: "CalculatePaint") as? CalculatePaint
//
//
//
//        objRestuarantReviewsViewController?.strValueHex=colorPicker.hexLabel.text!
//
//        if let aController = objRestuarantReviewsViewController
//        {
//            navigationController?.pushViewController(aController, animated: true)
//        }

        
        
    }
    
      @IBAction func takePhoto(_ sender: UIBarButtonItem) {
          cameraToggled = true
          getPhoto()
      }
    
      @IBAction func openGallery(_ sender: UIBarButtonItem) {
          cameraToggled = false
          getPhoto()
      }
      
      @IBAction func toggleTexture(_ sender: UIBarButtonItem) {
          applyPaint = false
      }
      
      @IBAction func toggleColor(_ sender: UIBarButtonItem) {
          applyPaint = true
      }
      
      @IBAction func chooseColor(_ sender: UIBarButtonItem) {
          colorPicker.isHidden = false
      }
    //MARK:- TABLE VIEW DELEGATES
    
    
    @IBAction func ClosePopUp(_ sender: UIBarButtonItem)
    {
        ViewPopup.isHidden=true
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
   
    
    
    //MARK:- Lifecycle Hooks
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        ViewPopup.isHidden=true
        imageView.isUserInteractionEnabled=true
        
        
        BtnCalculate.layer.cornerRadius=15.0
        BtnCalculate.layer.borderWidth=1.0
        BtnCalculate.layer.borderColor=UIColor.yellow.cgColor

        self.navigationController?.navigationBar.isHidden=false

        let colors = Colors()

        view.backgroundColor = UIColor.clear
        var backgroundLayer = colors.gl
        backgroundLayer!.frame = view.frame
        view.layer.insertSublayer(backgroundLayer!, at: 0)

        
        
        print("success")
        
//        colorPicker = ChromaColorPicker(frame: CGRect(x: view.frame.width/2 - 140, y: view.frame.height/2 - 270, width: 300, height: 300))
        colorPicker = ChromaColorPicker(frame: CGRect(x: 0, y: view.frame.height/3, width: view.frame.size.width, height: view.frame.size.width))

        colorPicker.delegate = self //ChromaColorPickerDelegate
        colorPicker.padding = 5
        colorPicker.stroke = 3
        colorPicker.currentColor = currentColor
        colorPicker.hexLabel.textColor = currentColor
               
        colorPicker.backgroundColor=UIColor.black
        colorPicker.isHidden = true
        view.addSubview(colorPicker)
        
        print("Yo")
        print(colorPicker.hexLabel.text!)
        
        if(strIndex=="1")
        {
            cameraToggled = true
            getPhoto()
        }
        else
        {
            getGallery()
        }
    }
    
    func getGallery() {
        
    cameraToggled = false
    getPhoto()
    }
    //MARK:- UIViewController Methods
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        
//        self.view.isUserInteractionEnabled=false
//        FTIndicator.showProgress(withMessage: "")
        
//        DispatchQueue.main.async { [self] in
//            self.colorPicker.isHidden=true
////            FTIndicator.showProgress(withMessage: "")
//        }
        DispatchQueue.global(qos: .userInitiated).async {
          
            DispatchQueue.main.async {
            self.colorPicker.isHidden=true
            }
        }
        

        if let touch = touches.first
        {
            if (touch.view == imageView)
            {
                DispatchQueue.main.async {
//                    FTIndicator.showProgress(withMessage: "")
                    self.colorPicker.isHidden=true
                }

//                FTIndicator.showProgress(withMessage: "")
//
//                self.colorPicker.isHidden=true

                self.view.isUserInteractionEnabled=false
//                FTIndicator.showProgress(withMessage: "")

                
                
            let position = touch.location(in: imageView)
            print(position)
            touchX = Double(position.x)
            touchY = Double(position.y)
            
            var overlayedImage = UIImage()
            
            if applyPaint
            {
                print(imageView.bounds.width)
                print(imageView.bounds.height)

                
//                if(WallPainterBridge().paintWall(of: imageView.image, touchPointX: touchX, touchPointY: touchY,imageWidth: Double(imageView.bounds.width),imageHeight: Double(imageView.bounds.height),colorToapply: currentColor)==nil)
//                {
//
//                }
//                else
//                {
                    overlayedImage = WallPainterBridge().paintWall(of: imageView.image, touchPointX: touchX, touchPointY: touchY,imageWidth: Double(imageView.bounds.width),imageHeight: Double(imageView.bounds.height),colorToapply: currentColor)
                    
    //                let array = ["horse", "cow", "camel", "sheep", "goat"]

//                self.view.isUserInteractionEnabled=true
                FTIndicator.dismissProgress()
                    let str:String = colorPicker.hexLabel.text!
                    array.add(str)
                    let defaults = UserDefaults.standard
                    defaults.set(array, forKey: "SavedStringArray")
//                }

            } else {
                let texture = UIImage(named: "brick_wall_texture_small_bricks_ios")
                overlayedImage = WallPainterBridge().applyTexture(to: imageView.image, textureToApply: texture, touchPointX: touchX, touchPointY: touchX,imageWidth: Double(imageView.bounds.width),imageHeight: Double(imageView.bounds.height))
            }
         
//                DispatchQueue.main.async {
                    FTIndicator.dismissProgress()
//                }
//                FTIndicator.dismissProgress()
                imageView.image = overlayedImage
                self.view.isUserInteractionEnabled=true

            }
        }
            
//        }
    }
    
    //MARK:- Custom Methods
    
    private func getPhoto() {
        if cameraToggled {
            imagePickerVC.sourceType = .camera
            
            self.croppingStyle = .default
            
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = false
            imagePicker.delegate = self
            self.present(imagePicker, animated: false, completion: nil)

            
            
        } else {
            imagePickerVC.sourceType = .photoLibrary
            
            
            self.croppingStyle = .default
            
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = false
            imagePicker.delegate = self
            self.present(imagePicker, animated: false, completion: nil)

            
        }
        
        
        
        //present(imagePickerVC, animated: true)
    
    
//        self.croppingStyle = .default
//
//        let imagePicker = UIImagePickerController()
//        imagePicker.sourceType = .photoLibrary
//        imagePicker.allowsEditing = false
//        imagePicker.delegate = self
//        self.present(imagePicker, animated: true, completion: nil)

    
    
    }
    
    
 

}

//MARK:- ImagePicker delegate methods

extension PaintViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate,CropViewControllerDelegate
{
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
//    {
//        picker.dismiss(animated: true, completion: nil)
//
//        guard let image = info[.editedImage] as? UIImage else
//        {
//            print("no image found")
//            return
//        }
    
//    - (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
//    {
//
//    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
//        self.navigationController!.popViewController(animated: true)
    
        picker.dismiss(animated: true, completion: {
//            self.present(cropController, animated: true, completion: nil)
            self.navigationController!.popViewController(animated: true)
                
        
        })
    
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        guard let image = (info[UIImagePickerController.InfoKey.originalImage] as? UIImage) else { return }
    
        print(image)
        image11 = image
        imageView.image = image
    
        let cropController = CropViewController(croppingStyle: croppingStyle, image: image)
        //cropController.modalPresentationStyle = .fullScreen
        cropController.delegate = self

//
//        self.present(cropController, animated: true, completion: nil)

        if croppingStyle == .circular {
            if picker.sourceType == .camera {
                picker.dismiss(animated: true, completion: {
                    self.present(cropController, animated: true, completion: nil)
                })
            } else {
                picker.pushViewController(cropController, animated: true)
            }
        }
        else { //otherwise dismiss, and then present from the main controller
            picker.dismiss(animated: true, completion: {
                self.present(cropController, animated: false, completion: nil)
                //self.navigationController!.pushViewController(cropController, animated: true)
            })
        }
        
    
    }
    public func cropViewController(_ cropViewController: CropViewController, didCropToImage image: UIImage, withRect cropRect: CGRect, angle: Int) {
        self.croppedRect = cropRect
        self.croppedAngle = angle
        updateImageViewWithImage(image, fromCropViewController: cropViewController)
    }
    
    public func cropViewController(_ cropViewController: CropViewController, didCropToCircularImage image: UIImage, withRect cropRect: CGRect, angle: Int) {
        self.croppedRect = cropRect
        self.croppedAngle = angle
        updateImageViewWithImage(image, fromCropViewController: cropViewController)
    }
    
    public func updateImageViewWithImage(_ image: UIImage, fromCropViewController cropViewController: CropViewController) {
        imageView.image = image
        
        image11 = image
        layoutImageView()
        
        self.navigationItem.leftBarButtonItem?.isEnabled = true
        
        if cropViewController.croppingStyle != .circular {
            imageView.isHidden = true
            
            cropViewController.dismissAnimatedFrom(self, withCroppedImage: image,
                                                   toView: imageView,
                                                   toFrame: CGRect.zero,
                                                   setup: { self.layoutImageView() },
                                                   completion: {
                                                    self.imageView.isHidden = false })
        }
        else {
            self.imageView.isHidden = false
            cropViewController.dismiss(animated: true, completion: nil)
        }
    }
}

//MARK:- ChromaColorPicker delegate methods

extension PaintViewController: ChromaColorPickerDelegate {
    func colorPickerDidChooseColor(_ colorPicker: ChromaColorPicker, color: UIColor) {
        currentColor = color
        colorPicker.hexLabel.textColor = currentColor
        colorPicker.isHidden = true
    }
}

