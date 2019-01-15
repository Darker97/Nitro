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

    //Haben wir eine Verbindung zum Netz?
    //Ansonsten müssen wir ja auch nicht versuchen irgendwas zu laden.
    var Online = true
    
    //Wetter Daten
    var Weather = ""
    var temp = ""
    
    //InfoAusgabe
    var CellEins = 0
    var CellZwei = 0

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


    
    
    //----------------------------------------------------
    //Mensa
    var MensaEssen = [String]()
    var MensaPreisStudent = [String]()
    var MensaPreisGast = [String]()
    var MensaPreisMitarbeiter = [String]()
    //___________________________________________________
    //Einstellungen

    //Abfrage für NFC
    var NFCCoder = "Christian"
    var NFCEnabled = true

    //Abfrage für den Touch- und FaceId
    var TouchIdEnabled = true


    //Zustand des Studenten also 1:Besucher 2:Bediensteter 3:Student
    var Zustand = 3

    //RSS:
    //Fachbereich
    var FachbereichAuswahl:Int = 0;
    
    var Fachbereich = ["Angewandte Informatik",
                       "Elektrotechnik und Informationstechnik",
                       "Lebensmitteltechnik",
                       "Oecotrophologie",
                       "Pflege und Gesundheit",
                       "Sozial-& Kulturwissenschaften",
                       "Sozialwesen",
                       "Wirtschaft"]

    var FachbereichLinks = ["https://www.hs-fulda.de/rss-ai/",
                            "https://www.hs-fulda.de/rss-et/",
                            "https://www.hs-fulda.de/rss-lt/",
                            "https://www.hs-fulda.de/rss-oe/",
                            "https://www.hs-fulda.de/rss-pg/",
                            "https://www.hs-fulda.de/rss-sk/",
                            "https://www.hs-fulda.de/rss-sw/",
                            "https://www.hs-fulda.de/rss-w/"]
    
    var AktuelleMeldungenLink = "https://www.hs-fulda.de/rss-aktuelle-meldungen/"
    var Pressemitteilungen = "https://www.hs-fulda.de/rss-pressemitteilungen/"

    //RssFach - Speicher
    var RSSFachTitleSpeicher = [String]()
    var RSSFachDetails = [String]()
    
    var RSSAKKTitle = [String]()
    var RSSAKKDetai = [String]()
    var RSSCell = 0
    
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

    
    //---------------------------------------------------
    struct Einstellungen:Codable{
        
        var Zustand: Int
        var NFCEnabled = true
        var TouchIdEnabled = true
        var FachbereichAuswahl: Int
    }
    
    func EinstellungenLaden(){
        UserDefaults.standard.set(42, forKey: "highscore")
        
        main.FachbereichAuswahl = UserDefaults.standard.integer(forKey: "FachbereichAuswahl")
        main.NFCEnabled = UserDefaults.standard.bool(forKey: "NFCEnabled")
        main.TouchIdEnabled = UserDefaults.standard.bool(forKey: "TouchIdEnabled")
        main.Zustand = UserDefaults.standard.integer(forKey: "Zustand")
    }
    
    func EinstellungenSpeichern(){
        UserDefaults.standard.set(main.FachbereichAuswahl, forKey: "FachbereichAuswahl")
        UserDefaults.standard.set(main.NFCEnabled, forKey: "NFCEnabled")
        UserDefaults.standard.set(main.TouchIdEnabled, forKey: "TouchIdEnabled")
        UserDefaults.standard.set(main.Zustand, forKey: "Zustand")
    }
    
    
    //---------------------------------------------------
    func kurzlebig(){
        
    }
    
    func Langlebig(){
        
    }

}
var main = HardCodedVar()
