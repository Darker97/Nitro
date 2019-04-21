//
//  HardCodedVar-Funktionen.swift
//  Nitro
//
//  Created by Christian Baltzer on 03.02.19.
//  Copyright © 2019 Christian Baltzer. All rights reserved.
//

import Foundation
/// Ursprünglich nur für Funktionen der HardcodedVar gedacht, enthält nun die meisten Funktionen, welche Daten Laden und speichern
class HardCodedVarFunktionen {
    /// Speichern aller Daten die in HardCodedVar gespeichert werden
    func Speichern() {
        //UserDefaults.standard.set(main, forKey: "HauptSpeicher")
        UserDefaults.standard.set(main.MensaResult, forKey: "MensaResult")
        UserDefaults.standard.set(main.FachbereichAuswahl, forKey: "FachbereichAuswahl")
        UserDefaults.standard.set(main.ZeitTag, forKey: "ZeitTag")
    }

    /// Laden aller Daten die in HardcodedVar gespeichert werden
    func laden() {
        if UserDefaults.standard.object(forKey: "FachbereichAuswahl") as? HardCodedVar != nil {
            //main = UserDefaults.standard.object(forKey: "HauptSpeicher") as! HardCodedVar
            main.MensaResult = UserDefaults.standard.object(forKey: "MensaResult") as! String
            main.FachbereichAuswahl = UserDefaults.standard.object(forKey: "FachbereichAuswahl") as! Int
            main.ZeitTag = UserDefaults.standard.object(forKey: "ZeitTag") as! Int
        }
    }

    // -----------------------------------------------------------
    /// Laden der KartenPunkte für die Karten.
    /// Angepasst, wir könnten theorethisch auch mehr Karten einladen.
    struct Punkt: Codable {
        let Title: String
        let locationName: String
        let latitude: Double
        let longitude: Double
    }

    func ladeKartenPunkte(DateiName: String) -> [Punkt] {
        let file = DateiName //this is the file. we will write to and read from it

        if let url = Bundle.main.path(forResource: file, ofType: "json") {
            do {
                let contents = try String(contentsOfFile: url)
                // print(contents)
                return VerarbeiteKartenPunkte(Inhalt: contents)
            } catch {
                print("Konnte nicht geladen werden.")
            }
        } else {
            print(file + " nicht gefunden.")
        }
        let w = [Punkt]()
        return w
    }

    func VerarbeiteKartenPunkte(Inhalt: String) -> [Punkt] {
        let temp = Inhalt.data(using: .utf8)
        let Ausgabe = try! JSONDecoder().decode([Punkt].self, from: temp!)
        return Ausgabe
    }

    // ------------------------------------------------
}
