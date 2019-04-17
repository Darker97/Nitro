//
//  TermineExportMenü.swift
//  Nitro
//
//  Created by Christian Baltzer on 23.02.19.
//  Copyright © 2019 Christian Baltzer. All rights reserved.
//

import Foundation
import QuickTableViewController

final class TermineExportMenü: QuickTableViewController {
    private var SOM2019    = true
    private var WIN201920   = true
    private var SOM20120    = true
    private var WIN202021   = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableContents = [
            Section(title: "", rows: [
                SwitchRow(title: "Sommersemmester 2019", switchValue: self.SOM2019, action: { _ in self.SOM2019 = !self.SOM2019}),
                SwitchRow(title: "Wintersemester 2019/20", switchValue: self.WIN201920, action: { _ in self.WIN201920 = !self.WIN201920}),
                SwitchRow(title: "Sommersemester 2020", switchValue: self.SOM20120, action: { _ in self.SOM20120 = !self.SOM20120}),
                SwitchRow(title: "Wintersemester 2020/21", switchValue: self.WIN202021, action: { _ in self.WIN202021 = !self.WIN202021})
                ], footer: "Hier können ausgewählte Termine in deinen Kalender exportiert werden"),
            
            Section(title: "", rows: [
                TapActionRow(title: "Exportieren", action: { _ in  self.export()})
                ], footer: "ACHTUNG: Termine können doppelt exportiert werden!"),
            
            
        ]
    }
    
    // MARK: - Actions
    
    private func showAlert(_ sender: Row) {
        
    }
    
    ///Exportiern der Kalenderdaten an den Kalender
    private func export(){
        //TODO: Export der KalenderDaten einfügen
    }
   
}
