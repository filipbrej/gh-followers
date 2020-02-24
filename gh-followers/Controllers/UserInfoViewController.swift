//
//  UserInfoViewController.swift
//  gh-followers
//
//  Created by Filip Brej on 2/24/20.
//  Copyright © 2020 Filip Brej. All rights reserved.
//

import UIKit

class UserInfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        let closeButton = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = closeButton
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }

}
