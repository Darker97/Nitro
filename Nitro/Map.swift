//
//  Map.swift
//  Nitro
//
//  Created by Christian Baltzer on 11.12.18.
//  Copyright © 2018 Christian Baltzer. All rights reserved.
//

import UIKit
import MapKit


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
    
    func prepareMap(){
        
        //Eingabe der Daten
        let Position = CLLocation(latitude: 50.5652, longitude: 9.6867)
        let distance: CLLocationDistance = 500
        let Region = MKCoordinateRegion(center: Position.coordinate, latitudinalMeters: distance,longitudinalMeters: distance)
        
        Map.setRegion(Region, animated: true)
        
        //Punkte hinzufügen
    let Gebäude11 = Places(title: "Mensa", locationName: "Gebäude 11",  coordinate: CLLocationCoordinate2D(latitude: 50.5656, longitude: 9.6869))
    let Gebäude12 = Places(title: "Bibliothek", locationName: "Gebäude 12",  coordinate: CLLocationCoordinate2D(latitude: 50.5652, longitude: 9.6874))
    let Gebäude10 = Places(title: "SSC", locationName: "Gebäude 10",  coordinate: CLLocationCoordinate2D(latitude: 50.5653, longitude: 9.6861))
    let Gebäude52 = Places(title: "Halle 8", locationName: "Gebäude 52",  coordinate: CLLocationCoordinate2D(latitude: 50.5648, longitude: 9.6846))
    let Gebäude46 = Places(title: "Gebäude E", locationName: "Gebäude 46", coordinate: CLLocationCoordinate2D(latitude: 50.5651, longitude: 9.6856))
    let Gebäude44 = Places(title: "Selbstlernzentrum", locationName: "Gebäude 46",  coordinate: CLLocationCoordinate2D(latitude: 50.5644, longitude: 9.6852))
    let Gebäude43 = Places(title: "Gebäude C", locationName: "Gebäude 43",  coordinate: CLLocationCoordinate2D(latitude: 50.5651, longitude: 9.6845))
   // let Gebäude51 = Places(title: "Gebäude 51", locationName: "Gebäude ",  coordinate: CLLocationCoordinate2D(latitude: 50.5648, longitude: 9.6851))
        
        

        Map.addAnnotation(Gebäude11)
        Map.addAnnotation(Gebäude12)
        Map.addAnnotation(Gebäude10)
        Map.addAnnotation(Gebäude52)
        Map.addAnnotation(Gebäude46)
        Map.addAnnotation(Gebäude44)
        Map.addAnnotation(Gebäude43)
    //    Map.addAnnotation(Gebäude51)
        
    }
//-------------------------------------------------------------------------
//


}
