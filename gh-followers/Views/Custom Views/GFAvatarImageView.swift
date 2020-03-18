//
//  GFAvatarImageView.swift
//  gh-followers
//
//  Created by Filip Brej on 2/17/20.
//  Copyright © 2020 Filip Brej. All rights reserved.
//

import UIKit

// Image shown in results for follower list
class GFAvatarImageView: UIImageView {
    
    let cache = NetworkManager.shared.cache

    // Show placeholder if user has no image set to profile
    let placeholderImage = Images.placeholder
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Avatar image cell properties
    private func configure() {
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
}
