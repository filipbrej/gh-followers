//
//  UIView+Ext.swift
//  gh-followers
//
//  Created by Filip Brej on 3/9/20.
//  Copyright © 2020 Filip Brej. All rights reserved.
//

import UIKit

extension UIView {
    
    func pinToEdges(of superview: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        topAnchor.constraint(equalTo: superview.topAnchor),
        leadingAnchor.constraint(equalTo: superview.leadingAnchor),
        trailingAnchor.constraint(equalTo: superview.trailingAnchor),
        bottomAnchor.constraint(equalTo: superview.bottomAnchor),
        ])
    }
    
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}
