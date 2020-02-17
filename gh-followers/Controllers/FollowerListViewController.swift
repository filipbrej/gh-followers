//
//  FollowerListViewController.swift
//  gh-followers
//
//  Created by Filip Brej on 2/11/20.
//  Copyright © 2020 Filip Brej. All rights reserved.
//

import UIKit

class FollowerListViewController: UIViewController {

    var username: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
