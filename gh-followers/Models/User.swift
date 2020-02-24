//
//  User.swift
//  gh-followers
//
//  Created by Filip Brej on 2/16/20.
//  Copyright © 2020 Filip Brej. All rights reserved.
//

import Foundation

struct User: Codable {
    let login: String
    let avatarUrl: String
    var name: String?
    var bio: String?
    var location: String?
    let publicRepos: Int
    let publicGists: Int
    let htmlUrl: String
    let following: Int
    let followers: Int
    let createdAt: String
}
