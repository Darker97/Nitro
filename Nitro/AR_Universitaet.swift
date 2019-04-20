//
//  AR_Universität.swift
//  Nitro
//
//  Created by Christian Baltzer on 19.04.19.
//  Copyright © 2019 Christian Baltzer. All rights reserved.
//

//import UIKit
import ARKit
import ARCL
import CoreLocation

class AR_Universitaet: UIViewController {
    
    @IBAction func zurück(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var AR_Anzeige: ARSCNView!
    var sceneLocationView = SceneLocationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         let temp = HardCodedVarFunktionen().ladeKartenPunkte(DateiName: "HochschullMap")
         
         for i in 0 ... temp.count - 1 {
         
             let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
             label.text = temp[i].Title
            
             let coordinate = CLLocationCoordinate2D(latitude: temp[i].latitude, longitude: temp[i].longitude)
             let location = CLLocation(coordinate: coordinate, altitude: 300)
             let image = UIImage.imageWithLabel(label: label)
            
            
             let annotationNode = LocationAnnotationNode(location: location, image: image)
            sceneLocationView.addLocationNodeWithConfirmedLocation(locationNode: annotationNode)
         }
         sceneLocationView.run()
         AR_Anzeige.addSubview(sceneLocationView)
    }
    override func viewDidLayoutSubviews() {
     super.viewDidLayoutSubviews()
     
     sceneLocationView.frame = view.bounds
     }
}
extension UIImage {
    class func imageWithLabel(label: UILabel) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(label.bounds.size, false, 0.0)
        label.layer.render(in: UIGraphicsGetCurrentContext()!)
        let img = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return img
    }
}
