//
//  VehiclesFilterViewController.swift
//  Car Rental
//
//  Created by Clineu Iansen Junior on 21/09/19.
//  Copyright © 2019 Clineu Iansen Junior. All rights reserved.
//

import UIKit

protocol VehicleFilterDelegate: class {
    func vehicleFilter(_ vehicleFilter: VehiclesFilterViewController, didApplyFilter filter: VehicleFilter)
}

class VehiclesFilterViewController: UIViewController {

    // Interface outlets
    @IBOutlet weak var fuelLevelLabel: UILabel!
    @IBOutlet weak var fuelLevelSlider: UISlider!
    @IBOutlet weak var fuelTypeStackView: UIStackView!
    @IBOutlet weak var cleanlinessTypeStackView: UIStackView!
    @IBOutlet weak var transmissionTypeStackView: UIStackView!
    
    var viewModel = VehicleFilterViewModel()
    weak var delegate: VehicleFilterDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewElements()
    }
    
    //MARK:- Actions
    
    @IBAction func didPressResetButton(_ sender: Any) {
        viewModel.resetFilter()
        configureViewElements()
    }
    
    @IBAction func didPressCancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didPressApplyFilterButton(_ sender: Any) {
        delegate?.vehicleFilter(self, didApplyFilter: viewModel.vehicleFilter)
        dismiss(animated: true, completion: nil)
    }
    
    //MARK:- UI configuration
    
    func configureViewElements() {
        configureFuelLevelSlider()
        configureFuelTypeStack()
        configureCleanlinessStack()
        configureTransmissionStack()
    }
    
    //MARK:- Slider configuration
    
    func configureFuelLevelSlider() {
        fuelLevelSlider.maximumValue = 1
        fuelLevelSlider.minimumValue = 0
        
        let currentLevel = Float(viewModel.vehicleFilter.fuelLevel ?? 0.0)
        fuelLevelSlider.value = currentLevel
        fuelLevelSlider.addTarget(self, action: #selector(sliderDidSlide(sender:)), for: .valueChanged)
        
        updateFuelLevelLabel(percent: Int(currentLevel * 100))
    }
    
    @objc func sliderDidSlide(sender: UISlider) {
        let percent = Int(sender.value * 100)
        updateFuelLevelLabel(percent: percent)
        viewModel.vehicleFilter.fuelLevel = Double(sender.value)
    }
    
    func updateFuelLevelLabel(percent: Int) {
        fuelLevelLabel.text = "\(percent)% or higher"
    }
    
    //MARK:- Stackview configuration
    
    func configureFuelTypeStack() {
        configureStackView(stackView: fuelTypeStackView,
                           withEnumType: FuelType.self,
                           initalValues: viewModel.vehicleFilter.fuelType)
    }
    
    func configureCleanlinessStack() {
        configureStackView(stackView: cleanlinessTypeStackView,
                           withEnumType: Cleanliness.self,
                           initalValues: viewModel.vehicleFilter.cleanliness)
    }
    
    func configureTransmissionStack() {
        configureStackView(stackView: transmissionTypeStackView,
                           withEnumType: Transmission.self,
                           initalValues: viewModel.vehicleFilter.transmission)
    }
    
    func configureStackView<T: Equatable & CaseIterable & LocalizableEnum>(
        stackView: UIStackView,
        withEnumType type: T.Type,
        initalValues: [T]? = nil)
    {
        stackView.removeAllArrangedSubviews()
        for type in T.allCases {
            let button = SelectionButton<T>(type: .system, value: type)
            button.setTitle(type.localizable, for: .normal)
            button.setTitleColor(.darkGray, for: .normal)
            button.setTitleColor(.white, for: .selected)
            button.sizeToFit()
            button.tintColor = .black
            button.addTarget(self, action: #selector(didSelectValue(sender:)), for: .touchUpInside)
            if let values = initalValues {
                button.isSelected = values.contains(where: { $0 == type })
            }
            stackView.addArrangedSubview(button)
        }
        stackView.layoutSubviews()
    }
    
    @objc func didSelectValue(sender: UIButton) {
        var isSelected = false
        if let button = sender as? SelectionButton<FuelType>,
            let value = button.value {
            isSelected = viewModel.didSelectFuelType(fuelType: value)
        }
        else if let button = sender as? SelectionButton<Transmission>,
            let value = button.value {
            isSelected = viewModel.didSelectTransmission(transmission: value)
        }
        else if let button = sender as? SelectionButton<Cleanliness>,
            let value = button.value {
            isSelected = viewModel.didSelectCleanliness(cleanliness: value)
        }
        sender.isSelected = isSelected
    }
}

// UIButton to store value
class SelectionButton<T>: UIButton {
    var value: T?
    
    convenience init(type: ButtonType, value: T) {
        self.init(type: type)
        self.value = value
    }
}
