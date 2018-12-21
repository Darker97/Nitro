//
//  DatenSpeicher.swift
//  Nitro
//
//  Created by Christian Baltzer on 26.11.18.
//  Copyright © 2018 Christian Baltzer. All rights reserved.
//

import Foundation
class DatenSpeicher{
    
    func SpeicherCoreData(name:String, Data:String){
        
    }
    
    func SpeicherDatenInTxt(name: String){
        let file = name //this is the file. we will write to and read from it
        
        let text = "some other text" //just a text
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            let fileURL = dir.appendingPathComponent(file)
            print (fileURL)
            
            
             //writing
             do {
                try text.write(to: fileURL, atomically: false, encoding: .utf8)
             }
             catch {/* error handling here */}
 
    }
    
    func SpeicherEinstellungen(){
        var arr = HardCodedVar().GibSpeicher()
        let file = "Eistellungen.txt" //this is the file. we will write to and read from it
        
        let text = "some other text" //just a text
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            let fileURL = dir.appendingPathComponent(file)
            print (fileURL)
            
            
            //writing
            do {
                try text.write(to: fileURL, atomically: false, encoding: .utf8)
            }
            catch {/* error handling here */}
        }
        
    }
    
    
}
}
