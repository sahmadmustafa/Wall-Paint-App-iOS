//
//  UIStackView+Helpers.swift
//  Car Rental
//
//  Created by Clineu Iansen Junior on 21/09/19.
//  Copyright © 2019 Clineu Iansen Junior. All rights reserved.
//

import UIKit

extension UIStackView {
    
    func removeAllArrangedSubviews() {
        for subView in arrangedSubviews {
            removeArrangedSubview(subView)
            subView.removeFromSuperview()
        }
    }
    
}
