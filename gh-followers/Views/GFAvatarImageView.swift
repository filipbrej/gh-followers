//
//  GFAvatarImageView.swift
//  gh-followers
//
//  Created by Filip Brej on 2/17/20.
//  Copyright © 2020 Filip Brej. All rights reserved.
//

import UIKit

// Image shown in results for follower list
class GFAvatarImageView: UIImageView {
    
    let cache = NetworkManager.shared.cache

    // Show placeholder if user has no image set to profile
    let placeholderImage = UIImage(named: "avatar-placeholder")!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Avatar image cell properties
    private func configure() {
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func downloadImage(from urlString: String) {
        // Cache the avatar image once loaded
        let cacheKey = NSString(string: urlString)
        if let image = cache.object(forKey: cacheKey) {
            self.image = image
            return
        }
        
        guard let url = URL(string: urlString) else { return }
        
        // Make network call
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil { return }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
            guard let data = data else { return }
            
            
            guard let image = UIImage(data: data) else { return }
            self.cache.setObject(image, forKey: cacheKey)
            
            // Set image on main thread
            DispatchQueue.main.async {
                self.image = image
            }
        }
        // Run the network call
        task.resume()
    }
}
