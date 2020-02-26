//
//  GFFollowerItemViewController.swift
//  gh-followers
//
//  Created by Filip Brej on 2/25/20.
//  Copyright © 2020 Filip Brej. All rights reserved.
//

import UIKit


class GFFollowerItemViewController: GFItemInfoViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .followers, with: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, with: user.following)
        
        actionButton.set(backgroundColor: .systemGreen, title: "See Followers List")
    }
}
