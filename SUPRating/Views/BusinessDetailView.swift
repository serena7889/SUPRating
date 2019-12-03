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
    
    @State private var ratingIndex = 0
    
    var business: Business!
    let ratingTitles = ["Overall", "Packaging", "Labelling", "Transparency", "Manufacturing"]
    
    var body: some View {
        VStack {
            
            MapView(businesses: [business], businessDetail: true)
                .frame(height: 300)
            Spacer()
            Text(business.title)
                .font(.largeTitle)
                .fontWeight(.bold)
            Text(business.subtitle)
                .font(.title)
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    self.ratingIndex = (self.ratingIndex - 1) % self.ratingTitles.count
                }) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 40))
                    .foregroundColor(Color.gray)
                }
                Spacer()
                RatingCard(title: self.ratingTitles[ratingIndex], score: self.business.ratings[ratingIndex])
                Spacer()
                Button(action: {
                    self.ratingIndex = (self.ratingIndex + 1) % self.ratingTitles.count
                }) {
                    Image(systemName: "chevron.right")
                        .font(.system(size: 40))
                        .foregroundColor(Color.gray)
                }
                Spacer()
            }
            Spacer()
            Button(action: {
                self.getDirections(business: self.business)
            }) {
                Text("Get directions")
                    .font(.headline)
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color.gray)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            Spacer()
        }
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.top/*@END_MENU_TOKEN@*/)
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
