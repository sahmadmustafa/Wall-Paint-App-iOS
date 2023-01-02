//
//  Transmission+Localizable.swift
//  Car Rental
//
//  Created by Clineu Iansen Junior on 21/09/19.
//  Copyright © 2019 Clineu Iansen Junior. All rights reserved.
//

import Foundation

extension Transmission: LocalizableEnum {
    var localizable: String {
        switch self {
        case .automatic:
            return "vehicle_details.model.transmission.automatic".localizable
        case .manual:
            return "vehicle_details.model.transmission.manual".localizable
        }
    }
}
