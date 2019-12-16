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
    
    @Environment(\.presentationMode) var presentationMode
    @State private var ratingIndex = 0
    
    var business: Business
    
    var body: some View {
        VStack {
            ZStack(alignment: .topLeading) {
                Map(businesses: [business], businessDetail: true)
                    .frame(height: 300)
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "xmark")
                        .font(.system(size: 30, weight: .semibold))
                        .foregroundColor(DARK_BLUE)
                        .padding(40)
                }
            }
            Spacer()
            Text(business.title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
            Text(business.subtitle)
                .font(.title)
                .foregroundColor(.white)
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    self.ratingIndex = (self.ratingIndex - 1) % DataService.instance.getRatingTitles().count
                }) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 40))
                    .foregroundColor(Color.white)
                }
                Spacer()
                RatingCard(title: DataService.instance.getRatingTitles()[ratingIndex], score: self.business.ratings[ratingIndex])
                Spacer()
                Button(action: {
                    self.ratingIndex = (self.ratingIndex + 1) % DataService.instance.getRatingTitles().count
                }) {
                    Image(systemName: "chevron.right")
                        .font(.system(size: 40))
                        .foregroundColor(Color.white)
                }
                Spacer()
            }
            Spacer()
            Button(action: {
                self.getDirections(business: self.business)
            }) {
                Text("Get directions")
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding()
                    .foregroundColor(DARK_BLUE)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            Spacer()
        }
        .background(DARK_BLUE)
        .edgesIgnoringSafeArea(.all)
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
