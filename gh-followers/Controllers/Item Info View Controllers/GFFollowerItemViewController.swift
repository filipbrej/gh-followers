//
//  GFFollowerItemViewController.swift
//  gh-followers
//
//  Created by Filip Brej on 2/25/20.
//  Copyright © 2020 Filip Brej. All rights reserved.
//

import UIKit


protocol GFFollowerItemVCDelegate: class {
    func didTapSeeFollowers(for user: User)
}



class GFFollowerItemViewController: GFItemInfoViewController {
    
    weak var delegate: GFFollowerItemVCDelegate!

    init(user: User, delegate: GFFollowerItemVCDelegate) {
        super.init(user: user)
        self.delegate = delegate
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .followers, with: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, with: user.following)
        
        actionButton.set(backgroundColor: .systemGreen, title: "See Followers List")
    }
    
    override func actionButtonTapped() {
        delegate.didTapSeeFollowers(for: user)
    }
}
