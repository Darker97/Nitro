//
//  HardCodedVar.swift
//  Nitro
//
//  Created by Christian Baltzer on 19.11.18.
//  Copyright © 2018 Christian Baltzer. All rights reserved.
//

import Foundation
class HardCodedVar {
    init() {}

    // Haben wir eine Verbindung zum Netz?
    // Ansonsten müssen wir ja auch nicht versuchen irgendwas zu laden.
    var Online = true

    // Wetter Daten
    var Weather = ""
    var temp = ""

    // InfoAusgabe
    var CellEins = 0
    var CellZwei = 0

    // Alle anderen Variablen die ich übersichtlich speichern will kommen hier her
    // ----------------------------------------------------

    // Daten die geladen werden werden hier zwischen Gespeichert.
    var Ergebnis = ""

    // Mensa
    var MensaResult = ""
    var NameDerInfos = [String]()
    var TextDerInfos = [String]()
    var cell = 0

    // ----------------------------------------------------
    // TODO: Speichern der Noten

    // ----------------------------------------------------
    // Alle Daten zur API der RMV
    var API_RMV_ID = ""
    var API_RMV_Ergebnis: Data? = nil
    
    var API_RMV_Name_ARRAY: [String] = []
    var API_RMV_Nummer_ARRAY: [String] = []
    var API_RMV_Richtung_ARRAY: [String] = []
    var API_RMV_Zeit_ARRAY: [String] = []

    // ----------------------------------------------------
    // Termine
    var TerminResult = ""

    // ___________________________________________________
    // Einstellungen

    // Abfrage für NFC
    var NFCCoder = ""
    var NFCEnabled = true

    // Abfrage für den Touch- und FaceId
    var TouchIdEnabled = true

    // Zustand des Studenten also 1:Besucher 2:Bediensteter 3:Student
    var Zustand = 3

    // RSS:
    // Fachbereich
    var FachbereichAuswahl: Int = 0

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

    // RssFach - Speicher
    var RSSFachTitleSpeicher = [String]()
    var RSSFachDetails = [String]()

    var RSSAKKTitle = [String]()
    var RSSAKKDetai = [String]()
    var RSSCell = 0

    // ____________________________________________________
    // Funktionen für die Variablen
    var isLockedIn = false
    // ---------------------------------------------------

    var ErsteZeit: Int = 0
    var ZeitMonat: Int = 0
    var ZeitWoche: Int = 0
    var ZeitTag: Int = 0

    // aktuelle UnixZeit
    var aktuelleZeit: Int = 0
}

var main = HardCodedVar()
