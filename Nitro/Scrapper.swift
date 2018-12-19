//
//  Scrapper.swift
//  Nitro
//
//  Created by Christian Baltzer on 12.12.18.
//  Copyright © 2018 Christian Baltzer. All rights reserved.
//

import Foundation
import SwiftSoup
import Alamofire
import Kanna
import SwiftScanner

class Scrapper{
 
    //------------------------------------------------
    //Laden aus dem Netz
    
    //Laden der Daten der Mensa
    //http://www.studentenwerk-giessen.de/Mensen_und_Cafeterien/Speisepl%E4ne/Mensa_Fulda.html
    func MensaData(){
        
        //Laden der Website als HTML Document
        Alamofire.request("http://www.maxmanager.de/daten-extern/sw-giessen/html/speiseplaene.php?einrichtung=fulda").responseString { response in
            print("\(response.result.isSuccess)")
            if let html = response.result.value {
                self.parseHTML(html: html)
            }
        }
        Alamofire.request("http://www.maxmanager.de/daten-extern/sw-giessen/html/speiseplaene.php?einrichtung=fulda", method: .get).responseString{ response in
            print("\(response.result.isSuccess)")
            if let html = response.result.value {
                    self.parseHTML(html: html)
        }
        }}
    
    func parseHTML(html: String) -> Void {
        
        //Umwandeln in Daten
        
       // let sc = Scanner.init(string: html)
        
        var Result: Set<String> = []
        
        var data = ""
        //print (html)
        let sc = StringScanner.init(html)
        while(!sc.isAtEnd){
            try! sc.scan(upTo: "<span class=\"artikel\">")
            try! data = sc.scan(upTo: "<sup style")!
            print (data)
            }
        
        
        /*
        while(sc.isAtEnd == false){
            let depthString: NSString = NSString()
            var data: NSString?
            var dump: NSString?               //Kleine Notlösung, wird nicht weiter beachtet
            sc.scanUpTo("<span class=\"artikel\">", into: &dump)
            sc.scanUpTo("<sup style", into: &data)
            print (data)
        }
        
        */
        if let doc = try? HTML(html: html, encoding: String.Encoding.utf8) {
            print(doc.title)
        
            for node in doc.css(".artikel") {
                print("first")
                print(node.text)
            }
        }
    }

  
    //Laden der RSS FEEDS
    func RSSLoader(){
        
    }
    
    //Laden der Hochschulwebsitedaten
    func DatenDerWebsite(){
        
    }
    
}
