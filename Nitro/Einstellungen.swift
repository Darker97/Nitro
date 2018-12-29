//
//  Einstellungen.swift
//  Nitro
//
//  Created by Christian Baltzer on 26.11.18.
//  Copyright © 2018 Christian Baltzer. All rights reserved.
//

import UIKit

class Einstellungen: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBAction func zurück(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var NFCregler: UISwitch!
    
    @IBOutlet weak var fingerRegler: UISwitch!
    
    @IBOutlet weak var Regler: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Fachbereich()
        // Do any additional setup after loading the view.
    }
    @IBAction func NFCan(_ sender: Any) {
        main.NFCEnabled = NFCregler.isOn
    }
    
    @IBAction func Fingerabdruckan(_ sender: Any) {
        main.TouchIdEnabled = fingerRegler.isOn
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NFCregler.isOn = main.NFCEnabled
        fingerRegler.isOn = main.TouchIdEnabled
        Regler.selectedSegmentIndex = main.Zustand
        Fachbereich()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        main.Zustand = Regler.selectedSegmentIndex
        main.FachbereichAuswahl = FachbereichPciker.selectedRow(inComponent: 1)
    }
    
    //------------------------------------------
    //Auswahl des Fachbereiches:
    @IBOutlet weak var FachbereichPciker: UIPickerView!
    func Fachbereich(){
        
        self.FachbereichPciker.dataSource = self
        self.FachbereichPciker.delegate = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        // Column count: use one column.
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        // Row count: rows equals array length.
        return main.Fachbereich.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        // Return a string from the array for this row.
        return main.Fachbereich[row]
    }
}
