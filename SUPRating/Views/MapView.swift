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
    
    var body: some View {
        Map(businesses: businesses)
    }
    
}

struct Map: UIViewRepresentable {
    
    var businesses: [Business]!
    
    func getAnnotation(forBusiness business: Business) -> MKPointAnnotation {
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

        let location = CLLocationCoordinate2D(latitude: 51.456704,longitude: -2.613017)

        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: location, span: span)
        map.setRegion(region, animated: true)
        
        map.removeAnnotations(map.annotations)

        if businesses.count == 1 {
            let pin = getAnnotation(forBusiness: businesses[0])
            map.addAnnotation(pin)
        } else {
            for i in 0..<businesses.count {
                let business = businesses[i]
                let pin = getAnnotation(forBusiness: business)
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
