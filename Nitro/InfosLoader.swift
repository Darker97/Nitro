//
//  InfosLoader.swift
//  Nitro
//
//  Created by Christian Baltzer on 08.01.19.
//  Copyright © 2019 Christian Baltzer. All rights reserved.
//

import Foundation

class InfosLoader {
    // Struktur für die Infos
    struct InfoCell: Codable {
        var Name: String
        var Text: String
    }

    struct KategorienCell: Codable {
        var Name: String
        var InfoCelle: InfoCell
    }

    struct HeaderCell: Codable {
        var Name: String
        var KategorienCell: [KategorienCell]
    }

    // ---------------------------------------------------

    // Unsere UNI Informationen werden als JSON übermittelt
    func ladeUniInfos() -> [HeaderCell] {
        let file = "UniInfo" // File aus dem wir laden wollen

        if let url = Bundle.main.path(forResource: file, ofType: "json") {
            do {
                let contents = try String(contentsOfFile: url)
                // print(contents)
                return VerarbeiteUniInfos(Inhalt: contents)
            } catch {
                print("Konnte nicht geladen werden.")
            }
        } else {
            print(file + " nicht gefunden.")
        }
        let w = [HeaderCell]()
        return w
    }

    // Uniinfos werden als JSON-File gespeichert und muss nur noch auseinandergenommen werden
    func VerarbeiteUniInfos(Inhalt: String) -> [HeaderCell] {
        /* var a = HeaderCell(Name: "test", KategorienCell: [InfosLoader.KategorienCell(Name: "test2", InfoCelle: InfoCell(Name: "test3", Text: "text1"))])

         let Eingabe = try! JSONEncoder().encode(a)
         print("test:\n")
         print(String(data: Eingabe, encoding: .utf8)!)
         */

        let temp = Inhalt.data(using: .utf8)
        let Ausgabe = try! JSONDecoder().decode([HeaderCell].self, from: temp!)
        return Ausgabe
    }
}
