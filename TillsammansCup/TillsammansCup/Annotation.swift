//
//  Annotation.swift
//  TillsammansCup
//
//  Created by Julia Friberg on 2017-04-05.
//  Copyright © 2017 Julia Friberg. All rights reserved.
//

import Foundation
import MapKit

enum AnnotationType {
    case food, field, music
}

class Annotation: NSObject, MKAnnotation {
    let title: String?
    let locationName: String
    let coordinate: CLLocationCoordinate2D
    var image: UIImage?
    let annotationType: AnnotationType
    
    
    init(title: String, locationName: String, coordinate: CLLocationCoordinate2D, annotationType: AnnotationType) {
        self.title = title
        self.locationName = locationName
        self.annotationType = annotationType
        self.coordinate = coordinate
    }
    
    convenience init(title: String, locationName: String, coordinate: CLLocationCoordinate2D, annotationType: AnnotationType, image: UIImage?) {
        self.init(title: title, locationName: locationName, coordinate: coordinate, annotationType: annotationType)
        self.image = image
    }
    
    var subtitle: String? {
        return locationName
    }
    
    
    var pinColor: UIColor {
        switch annotationType {
        case .food:
            return .green
        case .field:
            return .orange
        case .music:
            return .magenta
        default:
            return .blue
        }
        
    }
    
    
    override func isEqual(_ object: Any?) -> Bool {
        if let rhs = object as? Annotation {
            return self.title == rhs.title && self.locationName == rhs.locationName && self.coordinate.latitude == rhs.coordinate.latitude && self.coordinate.longitude == rhs.coordinate.longitude
        }
        return false
    }
    
}
