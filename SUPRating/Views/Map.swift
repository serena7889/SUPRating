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


struct MapView: UIViewRepresentable {
        
    var businesses: [Business]!
    var businessDetail: Bool!
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        return mapView
    }
    
    
    
    
    func getAnnotation(forBusiness business: Business) -> MKPointAnnotation {
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: business.latitude, longitude: business.longitude)
        annotation.title = business.title
        annotation.subtitle = "\(business.ratings[0])"
        return annotation
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
    
    
    
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView
        init(_ parent: MapView) {
            self.parent = parent
        }
        
        func mapView(_ mapView: MKMapView, viewFor
            annotation: MKAnnotation) -> MKAnnotationView?{
            let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "customView")
            annotationView.canShowCallout = true
            annotationView.image = UIImage(named: "pin")
           return annotationView
        }
        
//        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//
//            let identifier = "Placemark"
//            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
//
//            if annotationView == nil {
//                annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
//                annotationView?.canShowCallout = true
//                annotationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
//            } else {
//                annotationView?.annotation = annotation
//            }
//            return annotationView
//        }
        
    }
}

class BusinessAnnotation: NSObject, MKAnnotation {
    let title: String?
    let subtitle: String?
    let coordinate: CLLocationCoordinate2D
init(title: String?,
     subtitle: String?,
     coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
}



struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        Map(businesses: DataService.instance.getBusinesses(), businessDetail: false)
    }
}
