//
//  VehicleFilter.swift
//  Car Rental
//
//  Created by Clineu Iansen Junior on 21/09/19.
//  Copyright © 2019 Clineu Iansen Junior. All rights reserved.
//

import Foundation

struct VehicleFilter {
    var fuelLevel: Double?
    var fuelType: [FuelType] = []
    var cleanliness: [Cleanliness] = []
    var transmission: [Transmission] = []
}
