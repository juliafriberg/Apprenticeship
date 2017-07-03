//
//  ViewController.swift
//  MapLocation
//
//  Created by Julia Friberg on 2017-03-30.
//  Copyright © 2017 Julia Friberg. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        // Center map around location for Varvet
        
        centerMapOnLocation(MapControls.varvetLocation)
        // show location for Varvet on map
        mapView.addAnnotation(Annotation(title: "Varvet",
                                         locationName: "Östra Hamngatan 1, 411 10 Göteborg",
                                         coordinate: MapControls.varvetLocation.coordinate,
                                         image: #imageLiteral(resourceName: "varvet")))
       
        search()

    }

    let regionRadius: CLLocationDistance = 1000
    
    func centerMapOnLocation(_ at: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(at.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func mapView(_ mapView: MKMapView,
                 regionDidChangeAnimated animated: Bool) {
        search()
        
    }
    
    func search() {
        let request = MKLocalSearchRequest()
        request.naturalLanguageQuery = "restaurant"
        request.region = mapView.region
        
        let search = MKLocalSearch(request: request)
        search.start { response, error in
            guard let response = response else {
                print("There was an error searching for: \(String(describing: request.naturalLanguageQuery)) error: \(String(describing: error))")
                return
            }
            
            // create an annotation for each place found
            for item in response.mapItems {

                let name = item.name ?? "No name"
                let location = item.placemark.title ?? "No address"
                let annotation: Annotation = Annotation(title: name,
                                                        locationName: location,
                                                        coordinate: item.placemark.coordinate)
                
                if !(self.mapView.annotations as! [Annotation]).contains(annotation) {
                    self.mapView.addAnnotation(annotation)
                }
                
            }
        }
    }
}



