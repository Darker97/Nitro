//
//  Map.swift
//  Nitro
//
//  Created by Christian Baltzer on 11.12.18.
//  Copyright © 2018 Christian Baltzer. All rights reserved.
//

import UIKit
import MapKit
import SwiftScanner

class Map: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        prepareMap()
    }
    //------------------------------------------------------------------------
    //zurück Button
    @IBAction func zurück(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    //------------------------------------------------------------------------
    //Map
    @IBOutlet weak var Map: MKMapView!
    
    struct Punkt: Codable{
        let Title: String
        let locationName: String
        let latitude: Double
        let longitude: Double
    }
    
    func prepareMap(){
        
        //Eingabe der Daten
        let Position = CLLocation(latitude: 50.5652, longitude: 9.6867)
        let distance: CLLocationDistance = 500
        let Region = MKCoordinateRegion(center: Position.coordinate, latitudinalMeters: distance,longitudinalMeters: distance)
        
        Map.setRegion(Region, animated: true)
        
        //Punkte hinzufügen
        //Alle Punkte haben die Eigenschaften Title, Name und Koordinaten

        
        let temp = DatenLader().ladeKartenPunkte()
        
        for i in 0...temp.count-1{
            Map.addAnnotation(Places(title: temp[i].Title, locationName: temp[i].locationName,  coordinate: CLLocationCoordinate2D(latitude: temp[i].latitude, longitude: temp[i].longitude)))
        }
        /*
        Map.addAnnotation(Places(title: "Mensa", locationName: "Gebäude 11",  coordinate: CLLocationCoordinate2D(latitude: 50.5656, longitude: 9.6869)))
        Map.addAnnotation(Places(title: "Bibliothek", locationName: "Gebäude 12",  coordinate: CLLocationCoordinate2D(latitude: 50.5652, longitude: 9.6874)))
        Map.addAnnotation(Places(title: "SSC", locationName: "Gebäude 10",  coordinate: CLLocationCoordinate2D(latitude: 50.5653, longitude: 9.6861)))
        Map.addAnnotation(Places(title: "Halle 8", locationName: "Gebäude 52",  coordinate: CLLocationCoordinate2D(latitude: 50.5648, longitude: 9.6846)))
        Map.addAnnotation(Places(title: "Gebäude E", locationName: "Gebäude 46", coordinate: CLLocationCoordinate2D(latitude: 50.5651, longitude: 9.6856)))
        Map.addAnnotation(Places(title: "Selbstlernzentrum", locationName: "Gebäude 46",  coordinate: CLLocationCoordinate2D(latitude: 50.5644, longitude: 9.6852)))
        Map.addAnnotation(Places(title: "Gebäude C", locationName: "Gebäude 43",  coordinate: CLLocationCoordinate2D(latitude: 50.5651, longitude: 9.6845)))*/
    }
//-------------------------------------------------------------------------
//


}
