//
//  VehicleFilterViewModel.swift
//  Car Rental
//
//  Created by Clineu Iansen Junior on 21/09/19.
//  Copyright © 2019 Clineu Iansen Junior. All rights reserved.
//

import Foundation

class VehicleFilterViewModel {
    
    var vehicleFilter: VehicleFilter
    
    init(filter: VehicleFilter = VehicleFilter()) {
        self.vehicleFilter = filter
    }
    
    func resetFilter() {
        vehicleFilter = VehicleFilter()
    }
    
    // Returns true if value is selected
    func didSelectCleanliness(cleanliness: Cleanliness) -> Bool {
        var isSelected = false
        var currentFilter = vehicleFilter.cleanliness
        if currentFilter.contains(cleanliness) {
            currentFilter.removeAll(where: { $0 == cleanliness })
        } else {
            currentFilter.append(cleanliness)
            isSelected = true
        }
        vehicleFilter.cleanliness = currentFilter
        return isSelected
    }
    
    // Returns true if value is selected
    func didSelectFuelType(fuelType: FuelType) -> Bool {
        var isSelected = false
        var currentFilter = vehicleFilter.fuelType
        if currentFilter.contains(fuelType) {
            currentFilter.removeAll(where: { $0 == fuelType })
        } else {
            currentFilter.append(fuelType)
            isSelected = true
        }
        vehicleFilter.fuelType = currentFilter
        return isSelected
    }
    
    // Returns true if value is selected
    func didSelectTransmission(transmission: Transmission) -> Bool {
        var isSelected = false
        var currentFilter = vehicleFilter.transmission
        if currentFilter.contains(transmission) {
            currentFilter.removeAll(where: { $0 == transmission })
        } else {
            currentFilter.append(transmission)
            isSelected = true
        }
        vehicleFilter.transmission = currentFilter
        return isSelected
    }
}
