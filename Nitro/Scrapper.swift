//
//  Scrapper.swift
//  Nitro
//
//  Created by Christian Baltzer on 12.12.18.
//  Copyright © 2018 Christian Baltzer. All rights reserved.
//

import Foundation
import WebKit
import UIKit
import FeedKit

import SwiftSoup
import JavaScriptCore

class Scrapper{
 
    //------------------------------------------------
    //Laden aus dem Netz
    
    //Laden der html-Seite der Mensa
    //"http://www.maxmanager.de/daten-extern/sw-giessen/html/speiseplaene.php?einrichtung=fulda&w=dw"
    
    
    func SideScrapper(webView: WKWebView, Url: String){
        let url = NSURL(string: Url)
        let request = NSURLRequest(url: url! as URL)
        webView.load(request as URLRequest)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4), execute: {
            if (webView.isLoading){
                print("loaded")
                webView.evaluateJavaScript("document.documentElement.outerHTML.toString()") { (result, error) in
                    if let result = result {
                        do {
                            print("finished")
                            //return result as! String
                        } catch Exception.Error(_, let message) {
                            print(message)
                        }
                    }
                    return
                }}
        })
    }

    //Laden der Mensadaten
    func GetAnfrage(Adresse: String) -> String{
        
        var request = URLRequest(url: URL(string: Adresse)!)
        request.httpMethod = "GET"
        let session = URLSession.shared
        
        var Data = ""
        
            session.dataTask(with: request) {data, response, err in
            //print(String(data: data!, encoding: .utf8)!)
            main.MensaResult = String(data:data!, encoding: .utf8)!
            }.resume()

        print (Data)
        return Data
    }
    
    //Laden der Mensadaten
    func GetAnfrageMensa(Adresse: String) -> String{
        
        var request = URLRequest(url: URL(string: Adresse)!)
        request.httpMethod = "GET"
        let session = URLSession.shared
        
        var Data = ""
        
        session.dataTask(with: request) {data, response, err in
            //print(String(data: data!, encoding: .utf8)!)
            main.MensaResult = String(data:data!, encoding: .utf8)!
            }.resume()
        
        print (Data)
        return Data
    }
}
