//
//  HardCodedVar.swift
//  Nitro
//
//  Created by Christian Baltzer on 19.11.18.
//  Copyright © 2018 Christian Baltzer. All rights reserved.
//

import Foundation
class HardCodedVar{

    init() {}


    //Alle hardgecodeten Variablen kommen hierher


    //Alle anderen Variablen die ich übersichtlich speichern will kommen hier her
    //----------------------------------------------------
    //Daten die immer neu geladen werden

    //Speichern der Mensadaten
    var NameDerInfos = [String]()
    var TextDerInfos = [String]()
    var cell = 0;


    //TODO: Speichern der News???

    //----------------------------------------------------
    //Daten die nicht neu geladen werden müssen:

    //TODO: Speichern der RSS Feeds
    //TODO: Speichern der Noten



    //___________________________________________________
    //Einstellungen

    //Abfrage für NFC
    var NFCCoder = "Christian"
    var NFCEnabled = true

    //Abfrage für den Touch- und FaceId
    var TouchIdEnabled = true


    //Zustand des Studenten also 1:Besucher 2:Bediensteter 3:Student
    var Zustand = 3



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
var main = HardCodedVar()
