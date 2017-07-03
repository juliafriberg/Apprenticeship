//
//  MapViewController.swift
//  TillsammansCup
//
//  Created by Julia Friberg on 2017-04-05.
//  Copyright © 2017 Julia Friberg. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    let regionRadius: CLLocationDistance = 150
    let hedenLocation: CLLocation = CLLocation(latitude: 57.701575, longitude: 11.978438)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        
        // Center map around location for Heden
        centerMapOnLocation(hedenLocation)
        
        mapView.addAnnotations(annotations)

    }
    
    
    
    func centerMapOnLocation(_ at: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(at.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    
    // Customize the look for pin and information
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
    
    
    
    let annotations: [Annotation] = [Annotation(title: NSLocalizedString("field1", comment: ""),
                                                locationName: NSLocalizedString("field1", comment: ""),
                                                coordinate: CLLocationCoordinate2D(latitude: 57.701475, longitude: 11.978538),
                                                annotationType: .field),
                                     Annotation(title: NSLocalizedString("field2", comment: ""),
                                                locationName: NSLocalizedString("field2", comment: ""),
                                                coordinate: CLLocationCoordinate2D(latitude: 57.701515, longitude: 11.978498),
                                                annotationType: .field),
                                     Annotation(title: NSLocalizedString("field3", comment: ""),
                                                locationName: NSLocalizedString("field3", comment: ""),
                                                coordinate: CLLocationCoordinate2D(latitude: 57.701435, longitude: 11.978238),
                                                annotationType: .field),
                                     Annotation(title: NSLocalizedString("food1", comment: ""),
                                                locationName: NSLocalizedString("food1", comment: ""),
                                                coordinate: CLLocationCoordinate2D(latitude: 57.701515, longitude: 11.978498),
                                                annotationType: .food),
                                     Annotation(title: NSLocalizedString("food2", comment: ""),
                                                locationName: NSLocalizedString("food2", comment: ""),
                                                coordinate: CLLocationCoordinate2D(latitude: 57.701572, longitude: 11.978431),
                                                annotationType: .food),
                                     Annotation(title: NSLocalizedString("food3", comment: ""),
                                                locationName: NSLocalizedString("food3", comment: ""),
                                                coordinate: CLLocationCoordinate2D(latitude: 57.701275, longitude: 11.978138),
                                                annotationType: .food),
                                     Annotation(title: NSLocalizedString("music1", comment: ""),
                                                locationName: NSLocalizedString("music1", comment: ""),
                                                coordinate: CLLocationCoordinate2D(latitude: 57.701975, longitude: 11.978938),
                                                annotationType: .music),
                                     Annotation(title: NSLocalizedString("music2", comment: ""),
                                                locationName: NSLocalizedString("music2", comment: ""),
                                                coordinate: CLLocationCoordinate2D(latitude: 57.701215, longitude: 11.978118),
                                                annotationType: .music),]
    
}
