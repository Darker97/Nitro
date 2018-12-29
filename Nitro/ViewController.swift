//
//  ViewController.swift
//  Nitro
//
//  Created by Christian Baltzer on 10.11.18.
//  Copyright © 2018 Christian Baltzer. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBAction func MenuAuf(_ sender: Any) {
        performSegue(withIdentifier: "MenuAuf", sender: nil)
    }
    
    @IBOutlet weak var RSSAnzeige: UILabel!
    @IBOutlet weak var RSSDetails: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(main.RSSFachTitleSpeicher.count > 0){
            RSSAnzeige.text = main.RSSFachTitleSpeicher[0]
            RSSDetails.text = main.RSSFachDetails[0]}
        else{
            RSSAnzeige.isHidden = true
        }
        // Do any additional setup after loading the view, typically from a nib.
        //Scrapper().MensaData()
    }
    @IBAction func ButtonToGo(_ sender: Any) {
        self.performSegue(withIdentifier: "News", sender: nil)
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

