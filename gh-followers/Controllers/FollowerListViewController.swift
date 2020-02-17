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
        
        // Make call to network manager
        NetworkManager.shared.getFollowers(for: username, page: 1) { result in
            
            switch result {
                
            case .success(let followers):
                print(followers)
                
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Error", message: error.rawValue, buttonTitle: "OK")
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
