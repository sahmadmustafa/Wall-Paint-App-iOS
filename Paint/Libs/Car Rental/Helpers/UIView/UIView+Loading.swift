//
//  UIView+Loading.swift
//  Car Rental
//
//  Created by Clineu Iansen Junior on 21/09/19.
//  Copyright © 2019 Clineu Iansen Junior. All rights reserved.
//

import UIKit

private let kLoadingView = "LoadingView"

extension UIView {
    
    func startLoading(size: CGSize = CGSize(width: 200, height: 200)) {
        DispatchQueue.main.async {
            guard self.currentLoadingView == nil else {
                return
            }
            let activityIndicator = UIActivityIndicatorView(style: .gray)
            activityIndicator.frame = CGRect(origin: .zero, size: size)
            activityIndicator.center = self.center
            activityIndicator.restorationIdentifier = kLoadingView
            self.addSubview(activityIndicator)
            activityIndicator.startAnimating()
        }
    }
    
    func stopLoading() {
        DispatchQueue.main.async {
            let animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeInOut)
            animator.addAnimations { [weak self] in
                self?.currentLoadingView?.alpha = 0.0
            }
            animator.addCompletion { [weak self] (_) in
                self?.currentLoadingView?.removeFromSuperview()
            }
            animator.startAnimation()
        }
    }
    
    private var currentLoadingView: UIView? {
        return self.subviews.filter { $0.restorationIdentifier == kLoadingView }.first
    }
}
