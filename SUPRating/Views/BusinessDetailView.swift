//
//  BusinessDetailView.swift
//  SUPRating
//
//  Created by Serena Lambert on 03/12/2019.
//  Copyright © 2019 Serena Lambert. All rights reserved.
//

import SwiftUI
import MapKit

struct BusinessDetailView: View {
    
    var business: Business!
    
    var body: some View {
        VStack {
            MapView(businesses: [business])
                .frame(height: 300)
            Text(business.title).font(.title)
            Text(business.subtitle)
            Text("\(business.rating)")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(DataService.instance.getColor(forRating: business.rating))
            Button(action: {
                self.getDirections(business: self.business)
            }) {
                Text("Get directions")
            }
            Spacer()
        }
    }
    
    func getDirections(business: Business) {
        let placemark = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: business.latitude, longitude: business.longitude))
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "\(business.title) - \(business.subtitle)"
        let launchOptions = [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeWalking]
        mapItem.openInMaps(launchOptions: launchOptions)
    }
}

struct BusinessDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessDetailView(business: DataService.instance.getBusinesses()[1])
    }
}
