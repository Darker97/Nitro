//
//  ViewController.swift
//  Nitro
//
//  Created by Christian Baltzer on 10.11.18.
//  Copyright © 2018 Christian Baltzer. All rights reserved.
//

import UIKit
import WebKit
import HealthKit

class ViewController: UIViewController {

    @IBAction func MenuAuf(_ sender: Any) {
        performSegue(withIdentifier: "MenuAuf", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Weather().loadWeather()
        
        wetter()
    }
    
    
    
    //Anzeige des aktuellen Wetters
    @IBOutlet weak var wetterLabel: UILabel!
    @IBOutlet weak var WetterAnzeige: UILabel!
    @IBOutlet weak var temp: UILabel!
    @IBOutlet weak var TemperaturLabel: UILabel!
    func wetter(){
        if (main.Online && main.Weather != ""){
            WetterAnzeige.text = main.Weather
            temp.text = main.temp
            
            TemperaturLabel.isHidden = false
            wetterLabel.isHidden = false
            WetterAnzeige.isHidden = false
            temp.isHidden = false
        }else{
            wetterLabel.isHidden = true
            WetterAnzeige.isHidden = true
            temp.isHidden = true
            TemperaturLabel.isHidden = true
        }
        
    }
    
    //-----------------------------------------------
    //Abfrage ob jemmand eingelogt ist. Wenn nicht, werden bestimmte Objekte versteckt.
    override func viewWillAppear(_ animated: Bool) {
        if (HardCodedVar().isLockedIn == false){
            machSichtbar();
        }
    }
    func machSichtbar(){
        //Alle Views die nur der User sieht kommen hierher.
    }

}

