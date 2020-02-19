//
//  NetworkManager.swift
//  gh-followers
//
//  Created by Filip Brej on 2/16/20.
//  Copyright © 2020 Filip Brej. All rights reserved.
//

import UIKit



// Network Manager singleton
class NetworkManager {
    static let shared = NetworkManager()
    private let baseURL = "https://api.github.com/users/"
    let followersPerPage = 100
    
    // Create instance of cache
    let cache = NSCache<NSString, UIImage>()
    
    private init() {}
    
    func getFollowers(for username: String, page: Int, completed: @escaping (Result<[Follower], GFError>) -> Void ) {
        let endpoint = baseURL + "\(username)/followers?per_page=\(followersPerPage)&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidUsername))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            // Error handling
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.unableToComplete))
                return
                
            }
        
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            // Parse JSON if network request is successful
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completed(.success(followers))
            } catch {
                completed(.failure(.invalidData))
            }
            
        }
        // Run the network call
        task.resume()
    }
}
