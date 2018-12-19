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
    
    //---------------------------------------------
    //Lade Karten Punkte
    func LadeKartenPunkte(){
        let file = "KartenPunkte" //this is the file. we will write to and read from it
    
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
    }
    //----------------------------------------------
    //Lade UniInfos
    func ladeUniInfos(){
        let file = "UniInfos" //this is the file. we will write to and read from it
        
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
