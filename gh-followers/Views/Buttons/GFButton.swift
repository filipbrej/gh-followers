//
//  GFButton.swift
//  gh-followers
//
//  Created by Filip Brej on 2/10/20.
//  Copyright © 2020 Filip Brej. All rights reserved.
//

import UIKit

// Reusable custom button for the app
class GFButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    // Button properties
    private func configure() {
        layer.cornerRadius = 10
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func set(backgroundColor: UIColor, title: String) {
        self.backgroundColor = backgroundColor
        setTitle(title, for: .normal)
    }
    
    // Further button customization
    init(backgroundColor: UIColor, title: String) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
