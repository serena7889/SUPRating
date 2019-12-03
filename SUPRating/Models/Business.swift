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
    var title: String
    var subtitle: String
    var rating: Double
    var latitude: Double
    var longitude: Double
}
