//
//  Annotation.swift
//  MapLocation
//
//  Created by Julia Friberg on 2017-03-30.
//  Copyright © 2017 Julia Friberg. All rights reserved.
//

import Foundation
import MapKit

class Annotation: NSObject, MKAnnotation {
    let title: String?
    let locationName: String
    let coordinate: CLLocationCoordinate2D
    var image: UIImage?
    
    init(title: String, locationName: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.coordinate = coordinate
    }
    
    convenience init(title: String, locationName: String, coordinate: CLLocationCoordinate2D, image: UIImage?) {
        self.init(title: title, locationName: locationName, coordinate: coordinate)
        self.image = image
    }
    
    var subtitle: String? {
        return locationName
    }
    
    
    var pinColor: UIColor {
        if distance < 500 {
            return .green
        } else if distance < 1000 {
            return .yellow
        } else {
            return .red
        }
        
    }
    
    var distance: CLLocationDistance {
        return MapControls.varvetLocation.distance(from: CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude))
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        if let rhs = object as? Annotation {
            return self.title == rhs.title && self.locationName == rhs.locationName && self.coordinate.latitude == rhs.coordinate.latitude && self.coordinate.longitude == rhs.coordinate.longitude
        }
        return false
    }
    
}
