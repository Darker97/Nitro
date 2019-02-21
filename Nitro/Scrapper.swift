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
import Alamofire

class Scrapper{
 
    //------------------------------------------------
    //Laden aus dem Netz
    
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

    //Laden der Noten
    func GetNoten() {
        var login = ""
        var pass = ""
        
        
        let Adresse = "https://horstl.hs-fulda.de/qisserver/rds?state=user&type=1&category=auth.login"
        let parameters: [String: String] = [
            "asdf": login,
            "submit": "",
            "fdsa ": pass
        ]
        
        
        Alamofire.request(Adresse, method: .post, parameters: parameters).responseJSON {  response in
            
            //print(String(data: response.data!, encoding: .utf8)!)
        }

    }
    
    ///Laden der Mensadaten von den Server Adressen vom Studienwerk
    func GetAnfrageMensa(){
        let date = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: date)
        
        let year =  components.year
        let month = components.month
        let day = components.day
        
        let Datum: String
        
        if ((month as! Int) < 10){
            Datum = "\(year as! Int)" + "-" + "0" + "\(month as! Int)" + "-" + "\(day as! Int)"
        }else{
            Datum = "\(year as! Int)" + "-" + "\(month as! Int)" + "-" + "\(day as! Int)"
        }
        let parameters: [String: String] = [
            "func": "make_spl",
            "locId": "fulda",
            "lang": "de",
            "date": Datum
        ]
        
        var Adresse = "http://www.maxmanager.de/daten-extern/sw-giessen/html/speiseplan-render.php"
        Alamofire.request(Adresse, method: .post, parameters: parameters).response { response in
            //print(String(data: response.data!, encoding: .utf8)!)
            main.MensaResult = String(data:response.data!, encoding: .utf8)!
        }
    }
}
