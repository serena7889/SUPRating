//
//  DataService.swift
//  SUPRating
//
//  Created by Serena Lambert on 02/12/2019.
//  Copyright © 2019 Serena Lambert. All rights reserved.
//

import SwiftUI
import CoreLocation

class DataService {
    
    static let instance = DataService()
    
    private let businesses = [
        Business(title: "Sainsburys", subtitle: "Queen's Road", ratings: [87, 45, 78, 95, 43], latitude: 51.456891, longitude: -2.606811),
        Business(title: "Little Waitrose", subtitle: "Clifton", ratings: [56, 78, 97, 91, 43], latitude: 51.4568943, longitude: -2.6089997),
        Business(title: "Tesco Express", subtitle: "Regent St", ratings: [63, 48, 78, 72, 39], latitude: 51.4563932, longitude: -2.6173794)
    ]
    
    func getColor(forRating rating: Int) -> Color {
        if rating < 50 {
            return Color.red
        } else if rating < 75 {
            return Color.yellow
        } else {
            return Color.green
        }
    }
    
    func getBusinesses() -> [Business] {
        return businesses
    }
    
    func filterBusinesses(byTerm term: String, andRating rating: Int) -> [Business] {
        return businesses.filter { (business) -> Bool in
            (term == "" || business.title.contains(term)) && business.ratings[0] >= rating
        }
    }
    
}
