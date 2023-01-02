//
//  Vehicle.swift
//  Car Rental
//
//  Created by Clineu Iansen Junior on 19/09/19.
//  Copyright © 2019 Clineu Iansen Junior. All rights reserved.
//

import Foundation

enum FuelType: String, Codable, CaseIterable {
    case petrol = "P"
    case diesel = "D"
    case eletric = "E"
}

enum Cleanliness: String, Codable, CaseIterable {
    case regular = "REGULAR"
    case clean = "CLEAN"
    case veryClean = "VERY_CLEAN"
}

enum Transmission: String, Codable, CaseIterable {
    case automatic = "A"
    case manual = "M"
}

struct Vehicle: Decodable {
    let id: String
    let modelIdentifier: String
    let modelName: String
    let name: String
    let make: String
    let group: String
    let color: String
    let series: String
    let fuelType: FuelType
    let fuelLevel: Double
    let transmission: Transmission
    let licensePlate: String
    let latitude: Double
    let longitude: Double
    let innerCleanliness: Cleanliness
    let carImageUrl: String    
}
