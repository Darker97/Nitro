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

/// Klasse für das aktuelle Hauptmenü
class ViewController: UIViewController {
    
    
    /// Steuerung für die Menüleiste des Hauptmenüs
    ///
    /// - Parameter sender: any
    @IBAction func MenuAuf(_ sender: Any) {
        performSegue(withIdentifier: "MenuAuf", sender: nil)
    }
    
    
    
    /// Was wird gemacht wenn die View da ist?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Erklärung()
        
        //Weather().loadWeather()
        
        wetter()
    }
    
    func Erklärung(){
        if UserDefaults.standard.object(forKey: "FachbereichAuswahl") as? HardCodedVar == nil {
            let alert = UIAlertController(title: "Achtung", message: "Der Programmierer dieser APP übernimmt keine Haftung für die bereitgestellten Informationen.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
    
    @IBOutlet weak var wetterLabel: UILabel!
    @IBOutlet weak var WetterAnzeige: UILabel!
    @IBOutlet weak var temp: UILabel!
    @IBOutlet weak var TemperaturLabel: UILabel!
    
    
    /// steuert die Wetter Anzeige. Sind die Daten da UND wir sind Online (Schließen damit Fehler aus) werden die Anzeigen freigeschaltet.
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

}

