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
        Business(title: "Sainsburys", subtitle: "Queen's Road", rating: 4.7, latitude: 51.456891, longitude: -2.606811),
        Business(title: "Little Waitrose", subtitle: "Clifton", rating: 3.4, latitude: 51.4568943, longitude: -2.6089997),
        Business(title: "Tesco Express", subtitle: "Regent St", rating: 3.8, latitude: 51.4563932, longitude: -2.6173794)
    ]
    
    func getColor(forRating rating: Double) -> Color {
        if rating < 2 {
            return Color.red
        } else if rating < 3.5 {
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
            (term == "" || business.title.contains(term)) && business.rating >= Double(rating)
        }
    }
    
}
