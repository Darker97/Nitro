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
        HardCodedVar().TouchIdEnabled = fingerRegler.isOn
    }
    
    @IBAction func Fingerabdruckan(_ sender: Any) {
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NFCregler.isOn = HardCodedVar().NFCEnabled
        fingerRegler.isOn = HardCodedVar().TouchIdEnabled
    }

 

}