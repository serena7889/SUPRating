//
//  MapView.swift
//  SUPRating
//
//  Created by Serena Lambert on 02/12/2019.
//  Copyright © 2019 Serena Lambert. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    var businesses: [Business]!
    var businessDetail: Bool!
    
    var body: some View {
        Map(businesses: businesses, businessDetail: businessDetail)
    }
    
}

struct Map: UIViewRepresentable {
    
    var businesses: [Business]!
    var businessDetail: Bool!
    
    func getAnnotation(forBusiness business: Business) -> MKPointAnnotation {
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: business.latitude, longitude: business.longitude)
        annotation.title = business.title
        annotation.subtitle = "\(business.ratings[0])"
        return annotation
    }


    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }

    func updateUIView(_ map: MKMapView, context: Context) {

        let myLocation = CLLocationCoordinate2D(latitude: 51.456704,longitude: -2.613017)

        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        var region = MKCoordinateRegion(center: myLocation, span: span)
        
        
        map.removeAnnotations(map.annotations)

        if businessDetail {
            let businessLocation = CLLocationCoordinate2D(latitude: businesses[0].latitude, longitude: businesses[0].longitude)
            let pin = getAnnotation(forBusiness: businesses[0])
            region = MKCoordinateRegion(center: businessLocation, span: span)
            map.addAnnotation(pin)
        } else {
            for i in 0..<businesses.count {
                let business = businesses[i]
                let pin = getAnnotation(forBusiness: business)
                map.addAnnotation(pin)
            }
        }
        map.setRegion(region, animated: true)
    }

}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
