//
//  VCMapView.swift
//  MapLocation
//
//  Created by Julia Friberg on 2017-03-30.
//  Copyright © 2017 Julia Friberg. All rights reserved.
//

import Foundation
import MapKit

extension ViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? Annotation {
            let identifier = "pin"
            var view: MKAnnotationView
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) {
                dequeuedView.annotation = annotation
                view = dequeuedView
            } else {
                if annotation.image != nil {
                    view = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                    view.image = annotation.image
                    view.centerOffset = CGPoint(x: 0, y: -(annotation.image!.size.height/2))
                } else {
                    view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                    (view as! MKPinAnnotationView).pinTintColor = annotation.pinColor
                }
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -10, y: 0)
                
            }
            return view
        }
        return nil
    }
}
