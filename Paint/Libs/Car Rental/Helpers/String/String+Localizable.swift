//
//  String+Localizable.swift
//  Car Rental
//
//  Created by Clineu Iansen Junior on 21/09/19.
//  Copyright © 2019 Clineu Iansen Junior. All rights reserved.
//

import Foundation

extension String {
    
    var localizable: String {
        return NSLocalizedString(self, comment: self)
    }
    
}
