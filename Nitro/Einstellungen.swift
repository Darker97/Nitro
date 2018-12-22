//
//  Einstellungen.swift
//  Nitro
//
//  Created by Christian Baltzer on 26.11.18.
//  Copyright © 2018 Christian Baltzer. All rights reserved.
//

import UIKit

class Einstellungen: UIViewController {
    @IBAction func zurück(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var NFCregler: UISwitch!
    
    @IBOutlet weak var fingerRegler: UISwitch!
    
    @IBOutlet weak var Regler: UISegmentedControl!
    
    @IBAction func ReglerChange(_ sender: Any) {
        main.Zustand = Regler.selectedSegmentIndex
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func NFCan(_ sender: Any) {
        main.NFCEnabled = NFCregler.isOn
    }
    
    @IBAction func Fingerabdruckan(_ sender: Any) {
        main.TouchIdEnabled=fingerRegler.isOn
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NFCregler.isOn = main.NFCEnabled
        fingerRegler.isOn = main.TouchIdEnabled
        Regler.selectedSegmentIndex = main.Zustand
    }

    //------------------------------------------
    //zurück zum Menü

    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {
        self.performSegue(withIdentifier: "unwindToViewController1", sender: self)
    }

}
