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
    
    var business: Business?
    
    var body: some View {
        Map(business: business)
    }
}

struct Map: UIViewRepresentable {
    
    var business: Business?
    
    func getPin(business: Business) -> MKPointAnnotation {
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: business.latitude, longitude: business.longitude)
        annotation.title = business.title
        annotation.subtitle = "\(business.rating)"
        return annotation
    }
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ map: MKMapView, context: Context) {

        map.showsUserLocation = true
        let location = CLLocationCoordinate2D(latitude: 51.456704,longitude: -2.613017)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: location, span: span)
        map.setRegion(region, animated: true)

        if business != nil {
            let pin = getPin(business: business!)
            map.addAnnotation(pin)
        } else {
            for i in 0..<DataService.instance.getBusinesses().count {
                let business = DataService.instance.getBusinesses()[i]
                let pin = getPin(business: business)
                map.addAnnotation(pin)
            }
        }
    }
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
