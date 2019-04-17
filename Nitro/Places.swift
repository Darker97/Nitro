//
//  Places.swift
//  Nitro
//
//  Created by Christian Baltzer on 11.12.18.
//  Copyright © 2018 Christian Baltzer. All rights reserved.
//

import Foundation
import MapKit

class Places: NSObject, MKAnnotation {
    let title: String?
    let locationName: String
    let coordinate: CLLocationCoordinate2D

    init(title: String, locationName: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.coordinate = coordinate

        super.init()
    }

    var subtitle: String? {
        return locationName
    }
}
