//
//  UITableView+Ext.swift
//  gh-followers
//
//  Created by Filip Brej on 3/17/20.
//  Copyright © 2020 Filip Brej. All rights reserved.
//

import UIKit

extension UITableView {
    
    func reloadDataOnMainThread() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
    func removeExcessCells() {
        tableFooterView = UIView(frame: .zero)
    }
}
