//
//  VehicleDetailsViewModel.swift
//  Car Rental
//
//  Created by Clineu Iansen Junior on 20/09/19.
//  Copyright © 2019 Clineu Iansen Junior. All rights reserved.
//

import UIKit

protocol VehicleDetailsViewModelProtocol {
    func requestVehicleDetails()
}

protocol VehicleDetailsViewModelDelegate {
    func presentVehicleDetails(model: VehicleDetailsPresenter)
}

class VehicleDetailsViewModel: VehicleDetailsViewModelProtocol {
    var delegate: VehicleDetailsViewModelDelegate?
    
    let vehicle: Vehicle
    init(vehicle: Vehicle) {
        self.vehicle = vehicle
    }
    
    func requestVehicleDetails() {
        let vehicleImageURL = URL(string: vehicle.carImageUrl)
        let fuelPercentage = Int(vehicle.fuelLevel * 100)
        let fuelPercentageStr = "\(fuelPercentage)%"
        
        let fuelTypeIcon: UIImage = vehicle.fuelType == FuelType.eletric
            ? .batteryIcon
            : .gasStationIcon
        
        let model = VehicleDetailsPresenter(
            title: vehicle.modelName,
            licensePlate: vehicle.licensePlate,
            driverName: vehicle.name,
            backgroundImage: .carBackgroundImage,
            vehicleImageURL: vehicleImageURL,
            vehiclePlaceholderImage: .carPlaceholderImage,
            fuelPercentage: fuelPercentageStr,
            fuelTypeIcon: fuelTypeIcon,
            transmission: vehicle.transmission.localizable,
            innerCleanliness: vehicle.innerCleanliness.localizable)
        delegate?.presentVehicleDetails(model: model)
    }
}

struct VehicleDetailsPresenter {
    var title: String
    var licensePlate: String
    let driverName: String
    let backgroundImage: UIImage
    let vehicleImageURL: URL?
    let vehiclePlaceholderImage: UIImage
    let fuelPercentage: String
    let fuelTypeIcon: UIImage
    let transmission: String
    let innerCleanliness: String
}
