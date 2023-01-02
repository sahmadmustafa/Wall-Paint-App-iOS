//
//  Cleanliness+Localizable.swift
//  Car Rental
//
//  Created by Clineu Iansen Junior on 21/09/19.
//  Copyright © 2019 Clineu Iansen Junior. All rights reserved.
//

import Foundation

extension Cleanliness: LocalizableEnum {
    var localizable: String {
        switch self {
        case .clean:
            return "vehicle_details.model.clean.clean".localizable
        case .veryClean:
            return "vehicle_details.model.clean.very_clean".localizable
        case .regular:
            return "vehicle_details.model.clean.regular".localizable
        }
    }
}
