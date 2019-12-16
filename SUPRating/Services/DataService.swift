//
//  DataService.swift
//  SUPRating
//
//  Created by Serena Lambert on 02/12/2019.
//  Copyright © 2019 Serena Lambert. All rights reserved.
//

import SwiftUI
import CoreLocation

enum BusinessType: Hashable {
    case any
    case supermarket
    case coffeeShop
    case restaurant
    case shop
}

class DataService {
    
    static let instance = DataService()
    
    private let businesses = [
        Business(
            title: "Sainsburys",
            subtitle: "Queen's Road",
            type: .supermarket,
            ratings: [87, 45, 78, 95, 43],
            latitude: 51.456891,
            longitude: -2.606811
        ),
        Business(
            title: "Little Waitrose",
            subtitle: "Clifton",
            type: .supermarket,
            ratings: [56, 78, 97, 91, 43],
            latitude: 51.4568943,
            longitude: -2.6089997
        ),
        Business(
            title: "Tesco Express",
            subtitle: "Regent St",
            type: .supermarket,
            ratings: [63, 48, 78, 72, 39],
            latitude: 51.4563932,
            longitude: -2.6173794
        ),
        Business(
            title: "Costa Coffee",
            subtitle: "The Triangle",
            type: .coffeeShop,
            ratings: [27, 45, 78, 95, 43],
            latitude: 51.4624636,
            longitude: -2.6180751
        ),
        Business(
            title: "Subway",
            subtitle: "The Triangle",
            type: .restaurant,
            ratings: [47, 45, 78, 95, 43],
            latitude: 51.4618567,
            longitude: -2.6141268
        ),
        Business(
            title: "Balloon Bar",
            subtitle: "Richmond Building",
            type: .restaurant,
            ratings: [82, 45, 78, 95, 43],
            latitude: 51.4568735,
            longitude: -2.6150709
        ),
        Business(
            title: "Paperchase",
            subtitle: "The Triangle",
            type: .shop,
            ratings: [54, 45, 78, 95, 43],
            latitude: 51.4572792,
            longitude: -2.6201746
        ),
    ]
    
    
    private let ratingTitles = [
        "Overall",
        "Packaging",
        "Labelling",
        "Transparency",
        "Manufacturing"
    ]
    
    private let types = [
        BusinessType.any,
        BusinessType.supermarket,
        BusinessType.coffeeShop,
        BusinessType.restaurant,
        BusinessType.shop
    ]
    
    func getBusinesses() -> [Business] {
        return businesses
    }
    
    func getRatingTitles() -> [String] {
        return ratingTitles
    }
    
    func getTypes() -> [BusinessType] {
        return types
    }
    
    func getIcon(forBusinessType type: BusinessType) -> Image {
        switch type {
        case .any:
            return Image(systemName: "questionmark")
        case .supermarket:
            return Image(systemName: "cart.fill")
        case .coffeeShop:
            return Image(systemName: "c.circle")
        case .restaurant:
            return Image(systemName: "r.circle")
        case .shop:
            return Image(systemName: "tag.fill")
        }
    }
    
    func getColor(forRating rating: Int) -> Color {
        if rating < 50 {
            return Color.red
        } else if rating < 75 {
            return Color.yellow
        } else {
            return Color.green
        }
    }
    
    func filterBusinesses(byTerm term: String, andRating rating: Int, andBusinessType type: BusinessType) -> [Business] {
        let filtered = businesses.filter { (business) -> Bool in
            (term == "" || business.title.contains(term)) && business.ratings[0] >= rating && (type == .any || type == business.type)
        }
        return filtered.sorted { (bus1, bus2) -> Bool in
            bus1.ratings[0] > bus2.ratings[0]
        }
    }
    
}
