//
//  Scrapper.swift
//  Nitro
//
//  Created by Christian Baltzer on 12.12.18.
//  Copyright © 2018 Christian Baltzer. All rights reserved.
//

import FeedKit
import Foundation
import UIKit
import WebKit

import Alamofire
import JavaScriptCore
import SwiftSoup

class Scrapper {
    // ------------------------------------------------
    // Laden aus dem Netz

    func SideScrapper(webView: WKWebView, Url: String) {
        let url = NSURL(string: Url)
        let request = NSURLRequest(url: url! as URL)
        webView.load(request as URLRequest)

        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4), execute: {
            if webView.isLoading {
                print("loaded")
                webView.evaluateJavaScript("document.documentElement.outerHTML.toString()") { result, _ in
                    if let result = result {
                        do {
                            print("finished")
                            // return result as! String
                        } catch let Exception.Error(_, message) {
                            print(message)
                        }
                    }
                    return
            } }
        })
    }

    // Laden der Noten
    func GetNoten() {
        //TODO
    }

    /// Laden der Mensadaten von den Server Adressen vom Studienwerk
    func GetAnfrageMensa() {
        let date = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: date)

        let year = components.year
        let month = components.month
        let day = components.day

        let Datum: String

        if (month as! Int) < 10 {
            Datum = "\(year as! Int)" + "-" + "0" + "\(month as! Int)" + "-" + "\(day as! Int)"
        } else {
            Datum = "\(year as! Int)" + "-" + "\(month as! Int)" + "-" + "\(day as! Int)"
        }
        let parameters: [String: String] = [
            "func": "make_spl",
            "locId": "fulda",
            "lang": "de",
            "date": Datum,
        ]

        let Adresse = "http://www.maxmanager.de/daten-extern/sw-giessen/html/speiseplan-render.php"
        Alamofire.request(Adresse, method: .post, parameters: parameters).response { response in
            // print(String(data: response.data!, encoding: .utf8)!)
            main.MensaResult = String(data: response.data!, encoding: .utf8)!
        }
    }

    /// Laden der aktuellen Abfahrtszeiten aus der API des RMV
    func getBus() {
        var aktuelleZeit = ""
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm:ss"
        aktuelleZeit = formatter.string(from: date)

        let Adresse = "https://www.rmv.de/auskunft/bin/jp/stboard.exe/dn?L=vs_anzeigetafel&cfgfile=FuldaHochs_3020168_52987922&dataOnly=true&start=1&maxJourneys=5&wb=COOL&time=" + aktuelleZeit
        Alamofire.request(Adresse, method: .get).response { response in
            //print(String(data: response.data!, encoding: .utf8)!)
            main.API_RMV_Ergebnis = response.data
            //main.API_RMV_Ergebnis = response.data!
            
        }
    }
}
