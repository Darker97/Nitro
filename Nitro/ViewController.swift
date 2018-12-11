//
//  ViewController.swift
//  Nitro
//
//  Created by Christian Baltzer on 10.11.18.
//  Copyright © 2018 Christian Baltzer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func MenuAuf(_ sender: Any) {
        performSegue(withIdentifier: "MenuAuf", sender: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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

