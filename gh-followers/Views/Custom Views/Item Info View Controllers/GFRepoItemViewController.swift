//
//  GFRepoItemViewController.swift
//  gh-followers
//
//  Created by Filip Brej on 2/25/20.
//  Copyright © 2020 Filip Brej. All rights reserved.
//

import UIKit

class GFRepoItemViewController: GFItemInfoViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
        
    }
    
    override func actionButtonTapped() {
        delegate.didTapGitHubProfile(for: user)
    }
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .repos, with: user.publicRepos)
        itemInfoViewTwo.set(itemInfoType: .gists, with: user.publicGists)
    
        actionButton.set(backgroundColor: .systemPurple, title: "See GitHub Profile")
    }
}
