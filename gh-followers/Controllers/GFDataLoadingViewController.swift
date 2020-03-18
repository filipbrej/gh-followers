//
//  GFDataLoadingViewController.swift
//  gh-followers
//
//  Created by Filip Brej on 2/29/20.
//  Copyright © 2020 Filip Brej. All rights reserved.
//

import UIKit

class GFDataLoadingViewController: UIViewController {
    
     var containerView: UIView!

    // View that represents loading new followers
    func showLoadingView() {
        containerView = UIView(frame: view.bounds) // view fills whole screen
        view.addSubview(containerView)
        containerView.backgroundColor = .systemBackground
        containerView.alpha = 0
        
        // Change opacity of the view
        UIView.animate(withDuration: 0.25) {
            self.containerView.alpha = 0.8
        }
        
        // Indicator showing loading animation
        let activityIndicator = UIActivityIndicatorView(style: .large)
        containerView.addSubview(activityIndicator)
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            activityIndicator.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: containerView.centerXAnchor)
        ])
        
        activityIndicator.startAnimating()
    }
    
    // Remove loading view
    func dismissLoadingView() {
        DispatchQueue.main.async {
            self.containerView.removeFromSuperview()
            self.containerView = nil
        }
    }
    
    func showEmptyStateView(with message: String, in view: UIView) {
        let emptyStateView = GFEmptyStateView(message: message)
        emptyStateView.frame = view.bounds
        view.addSubview(emptyStateView)
    }
}
