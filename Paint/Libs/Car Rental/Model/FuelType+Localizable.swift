//
//  FuelType+Localizable.swift
//  Car Rental
//
//  Created by Clineu Iansen Junior on 21/09/19.
//  Copyright © 2019 Clineu Iansen Junior. All rights reserved.
//

import Foundation

extension FuelType: LocalizableEnum {
    var localizable: String {
        switch self {
        case .diesel:
            return "Diesel"
        case .eletric:
            return "Eletric"
        case .petrol:
            return "Petrol"
        }
    }
}
