//
//  Einstellungen.swift
//  Nitro
//
//  Created by Christian Baltzer on 26.11.18.
//  Copyright © 2018 Christian Baltzer. All rights reserved.
//

import UIKit

class Einstellungen: UIViewController {

    @IBOutlet weak var NFCregler: UISwitch!
    
    @IBOutlet weak var fingerRegler: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func NFCan(_ sender: Any) {
        HardCodedVar().NFCEnabled = NFCregler.isOn
    }
    
    @IBAction func Fingerabdruckan(_ sender: Any) {
        HardCodedVar().TouchIdEnabled=fingerRegler.isOn
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NFCregler.isOn = HardCodedVar().NFCEnabled
        fingerRegler.isOn = HardCodedVar().TouchIdEnabled
    }

    //------------------------------------------
    //zurück zum Menü
    @IBAction func zurück(_ sender: Any) {
        //self.performSegue(withIdentifier: "unwindToViewController1", sender: self)
        //self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
        
    }
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {
        self.performSegue(withIdentifier: "unwindToViewController1", sender: self)
    }

}
