//
//  UserInfoViewController.swift
//  gh-followers
//
//  Created by Filip Brej on 2/24/20.
//  Copyright © 2020 Filip Brej. All rights reserved.
//

import UIKit

class UserInfoViewController: UIViewController {
    
    let headerView = UIView()
    
    var username: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        let closeButton = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = closeButton
        
        NetworkManager.shared.getUserInfo(for: username) { [weak self] (result) in
            guard let self = self else {return}
            
            switch result {
            case .success(let user):
                DispatchQueue.main.async {
                    self.addChildVC(childVC: GFUserInfoHeaderViewController(user: user), to: self.headerView)
                }
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "OK")
            }
        }
        layoutUI()
    }
    
    func layoutUI() {
        view.addSubview(headerView)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 180)
        ])
    }
    
    func addChildVC(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
    
}
