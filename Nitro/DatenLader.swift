//
//  DatenLader.swift
//  Nitro
//
//  Created by Christian Baltzer on 19.11.18.
//  Copyright © 2018 Christian Baltzer. All rights reserved.
//

import Foundation
class DatenLader{
    
    func ladeDatenAusTxt(name: String){
        let file = name //this is the file. we will write to and read from it
        
        let text = "some other text" //just a text
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            let fileURL = dir.appendingPathComponent(file)
            print (fileURL)
            
            /*
            //writing
            do {
                try text.write(to: fileURL, atomically: false, encoding: .utf8)
            }
            catch {/* error handling here */}
            */
            
            //reading
            do {
                let text2 = try String(contentsOf: fileURL, encoding: .utf8)
                print(text2)
            }
            catch {/* error handling here */}
            
            //Scanner des Textes!!!
            
        }
    }
    func ladeCoreData(name: String){
        
    }
    
    
    //Laden aller Einstellungen, Variablen werden in der Hardcoded var gespeichert
    func ladeEinstellungen(){
        var arr = HardCodedVar().GibSpeicher()
        
        
        
    }
    
    
    
}
