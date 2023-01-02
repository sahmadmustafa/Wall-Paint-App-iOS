//
//  UIView+AlertLabel.swift
//  Car Rental
//
//  Created by Clineu Iansen Junior on 21/09/19.
//  Copyright © 2019 Clineu Iansen Junior. All rights reserved.
//

import UIKit

private let kCenterLabel = "CenterLabel"

extension UIView {
    
    func addCenterLabelView(text: String, textColor: UIColor = .lightGray) {
        DispatchQueue.main.async {
            let label: UILabel
            if let currentCenterLabel = self.currentCenterLabel {
                label = currentCenterLabel
            } else {
                let size = CGSize(width: self.frame.size.width-32, height: 21)
                let frame = CGRect(origin: .zero, size: size)
                label = UILabel(frame: frame)
            }
            
            label.textColor = textColor
            label.font = UIFont.systemFont(ofSize: 13, weight: .light)
            label.textAlignment = .center
            label.numberOfLines = 0
            label.text = text
            label.restorationIdentifier = kCenterLabel
            label.alpha = 0.0
            self.addSubview(label)
            
            DispatchQueue.main.asyncAfter(deadline: .now()+0.3) {
                label.alpha = 1.0
            }
            
            label.centerXAnchor
                .constraint(equalTo: self.centerXAnchor)
                .isActive = true
            label.centerYAnchor
                .constraint(equalTo: self.centerYAnchor)
                .isActive = true
            label.leadingAnchor
                .constraint(equalTo: self.leadingAnchor, constant: 16)
                .isActive = true
            label.trailingAnchor
                .constraint(equalTo: self.trailingAnchor, constant: -16)
                .isActive = true
            label.translatesAutoresizingMaskIntoConstraints = false

        }
    }
    
    func removeCenterLabelView() {
        DispatchQueue.main.async {
            self.currentCenterLabel?.removeFromSuperview()
        }
    }
    
    private var currentCenterLabel: UILabel? {
        return subviews.filter { $0.restorationIdentifier == kCenterLabel }.first as? UILabel
    }
}
