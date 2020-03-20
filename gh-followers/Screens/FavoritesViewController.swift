//
//  FavoritesViewController.swift
//  gh-followers
//
//  Created by Filip Brej on 2/9/20.
//  Copyright © 2020 Filip Brej. All rights reserved.
//

import UIKit

class FavoritesViewController: GFDataLoadingViewController {
    
    let tableView = UITableView()
    var favorites : [Follower] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureTableView()
    }
    
    // Constantly refreshes view with favorites as they are added
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getFavorites()
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        title = "Favorites"
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.rowHeight = 80
        tableView.delegate = self
        tableView.dataSource = self
        tableView.removeExcessCells()
        
        tableView.register(FavoriteCell.self, forCellReuseIdentifier: FavoriteCell.cellID)
    }
    
    func getFavorites() {
        
        PersistenceManager.retrieveFavorites { [weak self] result in
            guard let self = self else {return}
            
            switch result {
            case .success(let favorites):
                // Check if favorite is already in list
                if favorites.isEmpty {
                    self.showEmptyStateView(with: "You don't have any favorites.", in: self.view)
                } else {
                    self.favorites = favorites
                    
                    // Populate the table view
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        self.view.bringSubviewToFront(self.tableView)
                    }
                }
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Something went wrong.", message: error.rawValue, buttonTitle: "OK")
            }
        }
    }
}

extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
    
    // Handle the amount of favorites in the table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    // Set the favorite to each table view cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteCell.cellID) as! FavoriteCell
        let favorite = favorites[indexPath.row]
        cell.set(favorite: favorite)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let favorite = favorites[indexPath.row]
        let destVC = FollowerListViewController(username: favorite.login)
        navigationController?.pushViewController(destVC, animated: true)
    }
    
    // Swipe to delete favorite from list
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else {return}
        
        let favorite = favorites[indexPath.row]
        
        
        // Persist the updated list
        PersistenceManager.update(with: favorite, actionType: .remove) { [weak self] (error) in
            guard let self = self else {return}
            // Check if there is error
            guard let error = error else {

                self.favorites.remove(at: indexPath.row)
                // Delete row from table view
                tableView.deleteRows(at: [indexPath], with: .left)
                return
                
            }
            self.presentGFAlertOnMainThread(title: "Something went wrong.", message: error.rawValue, buttonTitle: "OK")
        }
    }
}
