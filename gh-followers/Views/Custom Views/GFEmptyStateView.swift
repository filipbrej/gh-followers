//
//  GFEmptyStateView.swift
//  gh-followers
//
//  Created by Filip Brej on 2/21/20.
//  Copyright © 2020 Filip Brej. All rights reserved.
//

import UIKit

// View to display when a user has 0 followers. 
class GFEmptyStateView: UIView {
    
    let messageLabel = GFTitleLabel(textAlign: .center, fontSize: 28)
    let logoImageView = UIImageView()
    let logoImageName = "empty-state-logo"

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(message: String) {
        super.init(frame: .zero)
        messageLabel.text = message
        configure()
    }
    
    // Configure the view the view
    private func configure() {
        addSubview(messageLabel)
        addSubview(logoImageView)
        
        // Label properties
        messageLabel.numberOfLines = 3
        messageLabel.textColor = .secondaryLabel
        
        // Image properties
        logoImageView.image = UIImage(named: logoImageName)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        // Constraints for view elements
        NSLayoutConstraint.activate([
            messageLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -150),
            messageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            messageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            messageLabel.heightAnchor.constraint(equalToConstant: 200),
            
            logoImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
            logoImageView.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
            logoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 170),
            logoImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 40)
        
        ])
    }
    
}
