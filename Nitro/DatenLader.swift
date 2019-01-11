//
//  DatenLader.swift
//  Nitro
//
//  Created by Christian Baltzer on 19.11.18.
//  Copyright © 2018 Christian Baltzer. All rights reserved.
//

import Foundation
import SwiftScanner


class DatenLader{


    //----------------------------------------------
    //Laden aus dem Speicher
    func ladeDatenAusTxt(name: String)->String{
        let file = name //this is the file. we will write to and read from it

        //let path = Bundle.main.path(forResource: file, ofType: "txt")
        if let filepath = Bundle.main.path(forResource: file, ofType: "txt")
        {
            do
            {
                let contents = try String(contentsOfFile: filepath)
                print(contents)
                return contents;

            }
            catch
            {
                print("Konnte nicht geladen werden.")
            }
        }
        else
        {
            print(file + " nicht gefunden.")
        }

        //Scanner des Textes!!!

        return ""
    }

    //----------------------------------------------
    //Lade UniInfos

    //Wurde, aufgrund der Übersicht in die "InfosLoader.swift" ausgelagert
    
    
    
    //-----------------------------------------------------------
    //Laden der KartenPunkte
    struct Punkt: Codable{
        let Title: String
        let locationName: String
        let latitude: Double
        let longitude: Double
    }
    func ladeKartenPunkte()-> [Punkt]{
        let file = "Map" //this is the file. we will write to and read from it
        
        //let path = Bundle.main.path(forResource: file, ofType: "txt")
        if let url = Bundle.main.path(forResource: file, ofType: "json")
        {
            do
            {
                let contents = try String(contentsOfFile: url)
                //print(contents)
                return VerarbeiteKartenPunkte(Inhalt: contents)
                
            }
            catch
            {
                print("Konnte nicht geladen werden.")
            }
        }
        else
        {
            print(file + " nicht gefunden.")
        }
        let w = [Punkt]()
        return w
    }
    func VerarbeiteKartenPunkte(Inhalt: String)-> [Punkt]{
        
        let temp = Inhalt.data(using: .utf8)
        let Ausgabe = try! JSONDecoder().decode([Punkt].self, from: temp!)
        return Ausgabe
    }

    
    //-----------------------------------------------------------
    //Laden aller Einstellungen, Variablen werden in der Hardcoded var gespeichert
    func ladeEinstellungen(){
        let file = "Einstellungen" //this is the file. we will write to and read from it

        //let path = Bundle.main.path(forResource: file, ofType: "txt")
        if let filepath = Bundle.main.path(forResource: file, ofType: "txt")
        {
            do
            {
                let contents = try String(contentsOfFile: filepath)
                print(contents)

            }
            catch
            {
                print("Konnte nicht geladen werden.")
            }
        }
        else
        {
            print(file + " nicht gefunden.")
        }

        //Scanner des Textes!!!


    }

    //---------------------------------------------
    func ladeCoreData(name: String){

    }




    //Noten laden
    func NotenLaden(){

    }
}
