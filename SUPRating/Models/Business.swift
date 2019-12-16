//
//  Business.swift
//  SUPRating
//
//  Created by Serena Lambert on 30/11/2019.
//  Copyright © 2019 Serena Lambert. All rights reserved.
//

import Foundation
import MapKit


struct Business: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let type: BusinessType
    let ratings: [Int]
    let latitude: Double
    let longitude: Double
}
