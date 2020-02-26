//
//  Date+Ext.swift
//  gh-followers
//
//  Created by Filip Brej on 2/25/20.
//  Copyright © 2020 Filip Brej. All rights reserved.
//

import Foundation

extension Date {
    
    // Convert from date back to string (after already converted from string to date)
    func convertToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        
        return dateFormatter.string(from: self)
    }
}
