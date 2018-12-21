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
    func ladeDatenAusTxt(name: String){
        let file = name //this is the file. we will write to and read from it
        
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
    
    //----------------------------------------------
    //Lade UniInfos
    
    //Unsere UNI Informationen werden als JSON übermittelt
    func ladeUniInfos()-> [Item]{
        let file = "UniInfo" //this is the file. we will write to and read from it
        
        //let path = Bundle.main.path(forResource: file, ofType: "txt")
        if let url = Bundle.main.path(forResource: file, ofType: "json")
        {
            do
            {
                let contents = try String(contentsOfFile: url)
                //print(contents)
                return VerarbeiteUniInfos(Inhalt: contents)
                
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
        let w = [Item]()
        return w
    }
    
    //Struktur für die Infos
    struct Item: Codable{
        let Name: String
        let Info: String
    }
    
    //Uniinfos werden als JSON-File gespeichert und muss nur noch auseinandergenommen werden
    func VerarbeiteUniInfos(Inhalt: String)-> [Item]{
        
        let temp = Inhalt.data(using: .utf8)
        let Ausgabe = try! JSONDecoder().decode([Item].self, from: temp!)
        /*
        //print(Ausgabe)
        var b:String = ""
        var a: String = ""
        let AusgabeLänge = Ausgabe.count
        for i in 0...AusgabeLänge-1{
            //print(Ausgabe[i].Name)
            b = Ausgabe[i].Name
            a = Ausgabe[i].Info
            HardCodedVar().NameDerInfos.append(b)
            HardCodedVar().TextDerInfos.append(a)
        }
        for i in 0...AusgabeLänge-1{
            print (HardCodedVar().NameDerInfos[i])
        }
        */
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
}
