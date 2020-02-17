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
        navigationController?.navigationBar.prefersLargeTitles = true
        
        NetworkManager.shared.getFollowers(for: username, page: 1) { (followers, error) in
            guard let followers = followers else {
                self.presentGFAlertOnMainThread(title: "Error", message: error!, buttonTitle: "OK")
                return
                
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
