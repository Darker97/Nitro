//
//  Officielle Karte.swift
//  Nitro
//
//  Created by Christian Baltzer on 21.04.19.
//  Copyright © 2019 Christian Baltzer. All rights reserved.
//

import UIKit

class Officielle_Karte: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var ScrollView: UIScrollView!
    @IBOutlet weak var Bild_Karte: UIImageView!
    
    @IBAction func zurück(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ScrollView.minimumZoomScale = 1.0
        ScrollView.maximumZoomScale = 6.0
        
    }
    
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        
        return Bild_Karte
    }

}
