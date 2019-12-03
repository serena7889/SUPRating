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
        Business(title: "Sainsburys", subtitle: "Queen's Road", rating: 87, latitude: 51.456891, longitude: -2.606811),
        Business(title: "Little Waitrose", subtitle: "Clifton", rating: 64, latitude: 51.4568943, longitude: -2.6089997),
        Business(title: "Tesco Express", subtitle: "Regent St", rating: 36, latitude: 51.4563932, longitude: -2.6173794)
    ]
    
    func getColor(forRating rating: Int) -> Color {
        if rating < 40 {
            return Color.red
        } else if rating < 70 {
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
            (term == "" || business.title.contains(term)) && business.rating >= rating
        }
    }
    
}
