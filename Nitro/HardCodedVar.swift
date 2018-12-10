//
//  HardCodedVar.swift
//  Nitro
//
//  Created by Christian Baltzer on 19.11.18.
//  Copyright © 2018 Christian Baltzer. All rights reserved.
//

import Foundation
class HardCodedVar{
    //Alle hardgecodeten Variablen kommen hierher
    

    
    
    //Alle anderen Variablen die ich übersichtlich speichern will kommen hier her
    

    //___________________________________________________
    //Einstellungen
    
    //Abfrage für NFC
    var NFCCoder = "Christian"
    var NFCEnabled = true
    
    //Abfrage für den Touch- und FaceId
    var TouchIdEnabled = true
    
    
    
    
    //____________________________________________________
    //Funktionen für die Variablen
    var isLockedIn = false;

    
    
    //gibt alle Werte des Zwischenspeichers zurück
        // -> Alle Werte müssen eingetragen werden.
    func GibSpeicher()-> [String]{
        var erg: [String] =
            [
                "NFCCoder",
                "NFCEnabled",
                "TouchIdEnabled",
                "isLockedIn"
            ]
        return erg;
    }
    
    
}
