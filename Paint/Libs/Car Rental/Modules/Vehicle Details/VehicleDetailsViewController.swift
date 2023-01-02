//
//  VehicleDetailsViewController.swift
//  Car Rental
//
//  Created by Clineu Iansen Junior on 20/09/19.
//  Copyright © 2019 Clineu Iansen Junior. All rights reserved.
//

import UIKit
//import Kingfisher
//
//protocol VehicleDetailsDelegate: class {
//    func vehicleDetailsdidPressCloseButton(_ vehicleDetails: VehicleDetailsViewController)
//}
//
//class VehicleDetailsViewController: UIViewController {
//
//    // Interface outlets
//    @IBOutlet weak var licensePlateLabel: UILabel!
//    @IBOutlet weak var driverLabel: UILabel!
//    @IBOutlet weak var titleLabel: UILabel!
//    @IBOutlet weak var backgroundImageView: UIImageView!
//    @IBOutlet weak var carImageView: UIImageView!
//    @IBOutlet weak var fuelImageView: UIImageView!
//    @IBOutlet weak var fuelLevelLabel: UILabel!
//    @IBOutlet weak var gearboxTypeLabel: UILabel!
//    @IBOutlet weak var cleanlinessLabel: UILabel!
//    
//    // Var's
//    var viewModel: VehicleDetailsViewModel?
//    weak var delegate: VehicleDetailsDelegate?
//    
//    // Presentation
//    private let defaultAnimation = UIViewPropertyAnimator(duration: 0.5, dampingRatio: 0.8)
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        self.view.layer.cornerRadius = 10
//        self.view.layer.masksToBounds = true
//        self.view.clipsToBounds = true
//        
//        self.viewModel?.requestVehicleDetails()
//    }
//    
//    init(viewModel: VehicleDetailsViewModel) {
//        super.init(nibName: "VehicleDetailsViewController", bundle: nil)
//        
//        self.viewModel = viewModel
//        self.viewModel?.delegate = self
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
//    
//    @IBAction func didPressCloseButton() {
//        delegate?.vehicleDetailsdidPressCloseButton(self)
//    }
//    
//    func presentIn(viewController parent: UIViewController) {
//        parent.view.addSubview(view)
//        parent.addChild(self)
//        didMove(toParent: parent)
//        
//        let parentFrame = parent.view.frame
//        
//        let finalPosition: CGPoint = {
//            let minY = parentFrame.size.height - 320
//            let yPosition = min(parentFrame.size.height/2, minY)
//            let finalPosition = CGPoint(x: 0, y: yPosition)
//            return finalPosition
//        }()
//
//        let initialPosition = CGPoint(x: 0, y: parentFrame.size.height)
//        view.frame = CGRect(origin: initialPosition, size: parentFrame.size)
//        view.alpha = 0.7
//        
//        defaultAnimation.addAnimations {
//            self.view.frame = CGRect(origin: finalPosition, size: parentFrame.size)
//            self.view.alpha = 1.0
//        }
//        defaultAnimation.startAnimation()
//    }
//    
//    func dismissDetailsFrom(viewController parent: UIViewController) {
//        self.willMove(toParent: nil)
//        
//        let parentFrame = parent.view.frame
//        let finalFrame = CGPoint(x: 0, y: parentFrame.size.height)
//        defaultAnimation.addAnimations {
//            self.view.frame.origin = finalFrame
//            self.view.alpha = 0.7
//        }
//        defaultAnimation.addCompletion { (_) in
//            self.removeFromParent()
//            self.view.removeFromSuperview()
//        }
//        defaultAnimation.startAnimation()
//    }
//}
//
//extension VehicleDetailsViewController: VehicleDetailsViewModelDelegate {
//    
//    func presentVehicleDetails(model: VehicleDetailsPresenter) {
//        self.titleLabel.text = model.title
//        self.licensePlateLabel.text = model.licensePlate
//        self.driverLabel.text = model.driverName
//        self.backgroundImageView.image = model.backgroundImage
//        self.carImageView.kf.setImage(with: model.vehicleImageURL, placeholder: model.vehiclePlaceholderImage)
//        self.fuelImageView.image = model.fuelTypeIcon
//        self.fuelLevelLabel.text = model.fuelPercentage
//        self.gearboxTypeLabel.text = model.transmission
//        self.cleanlinessLabel.text = model.innerCleanliness
//    }
//}
