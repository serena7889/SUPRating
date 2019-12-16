//
//  MapView.swift
//  SUPRating
//
//  Created by Serena Lambert on 02/12/2019.
//  Copyright © 2019 Serena Lambert. All rights reserved.
//

import SwiftUI
import MapKit

struct Map: View {
    
    var businesses: [Business]!
    var businessDetail: Bool!
    
    var body: some View {
        MapView(businesses: businesses, businessDetail: businessDetail)
    }
    
}

//struct MapView: UIViewRepresentable {
//
//
//    var businesses: [Business]!
//    var businessDetail: Bool!
//
//    func getAnnotation(forBusiness business: Business) -> MKPointAnnotation {
//        let annotation = MKPointAnnotation()
//        annotation.coordinate = CLLocationCoordinate2D(latitude: business.latitude, longitude: business.longitude)
//        annotation.title = business.title
//        annotation.subtitle = "\(business.ratings[0])"
//        return annotation
//    }
//
//
//    func makeUIView(context: Context) -> MKMapView {
//        MKMapView(frame: .zero)
//    }
//
//    func updateUIView(_ map: MKMapView, context: Context) {
//
//        let myLocation = CLLocationCoordinate2D(latitude: 51.456704,longitude: -2.613017)
//
//        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
//        var region = MKCoordinateRegion(center: myLocation, span: span)
//
//
//        map.removeAnnotations(map.annotations)
//
//        if businessDetail {
//            let businessLocation = CLLocationCoordinate2D(latitude: businesses[0].latitude, longitude: businesses[0].longitude)
//            let pin = getAnnotation(forBusiness: businesses[0])
//            region = MKCoordinateRegion(center: businessLocation, span: span)
//            map.addAnnotation(pin)
//        } else {
//            for i in 0..<businesses.count {
//                let business = businesses[i]
//                let pin = getAnnotation(forBusiness: business)
//                map.addAnnotation(pin)
//            }
//        }
//        map.setRegion(region, animated: true)
//    }
//
//
//    func makeCoordinator() -> () {
//        Coordinator(self)
//    }
//
//    class Coordinator: NSObject, MKMapViewDelegate {
//
//        var parent: Map
//
//        init(_ parent: Map) {
//            self.parent = parent
//        }
//
//    }
//
//
//}


struct MapView: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        return mapView
    }

    func updateUIView(_ view: MKMapView, context: Context) {

    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView

        init(_ parent: MapView) {
            self.parent = parent
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        Map()
    }
}
