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

class Scrapper{
 
    //------------------------------------------------
    //Laden aus dem Netz
    
    //Laden der html-Seite der Mensa
    //http://www.studentenwerk-giessen.de/Mensen_und_Cafeterien/Speisepl%E4ne/Mensa_Fulda.html
    
    var webView = WKWebView()
    func MensaData(Webview: WKWebView){
        
        //Laden der Website als HTML Document
        webView = Webview
        let b = "http://www.maxmanager.de/daten-extern/sw-giessen/html/speiseplaene.php?einrichtung=fulda&w=dw"
        let url = NSURL(string: b)
        let request = NSURLRequest(url: url! as URL)
        webView.load(request as URLRequest)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4), execute: {
            self.hintergrunf()
        })
        
        //let doc = WebView.stringByEvaluatingJavaScriptFromString("document.documentElement.outerHTML")
        
    }
    //Verwerten des Codes
    func hintergrunf() {

            if (!webView.isLoading){
                print("loaded")
                webView.evaluateJavaScript("document.documentElement.outerHTML.toString()") { (result, error) in
                    if let result = result {
                        //print(result)
                        //"herausschneiden" von dem String den wir wollen
                        var erg: NSString?
                        let sc = Scanner(string: result as! String)
                        sc.scanUpTo("<!-- M A I N -->", into: nil)
                        sc.scanUpTo("<!-- LEGENDE -->", into: &erg)
                        
                        self.htmlConverter(html: erg as! String)
                        
                    }
                return
                }}
        }

    //Scrapper für html
    func htmlConverter(html: String){
        print(html.count)
        if(html.count == 650){
            //main.MensaEssen.append("Test")
            main.MensaEssen.append("Geschlossen")
            return
        }
        
        //Todo: Anpassen an die Daten der Mensa app
        let userscanner = Scanner(string: html )
        var userscanned: NSString?
        
        if userscanner.scanUpTo("<td class=\"cell1\"><div>", into:nil){
            userscanner.scanString("div>", into:nil)
            if userscanner.scanUpTo("</div></td></tr>", into:&userscanned) {
                let newResult: String = userscanned as! String
                print("NewResultValue: \(newResult)")
            }
        }
        //print(erg)
        
    }
    
    //-----------------------------------------------
    //Laden der RSS FEEDS
    func RSSLoader(){
        /*let Fachbereich = URL(string: main.FachbereichLinks[main.FachbereichAuswahl])!
        let Allgemein = URL(string: main.AktuelleMeldungenLink)!
        
        let Parser1 = FeedParser(URL: Fachbereich)
        let Parser2 = FeedParser(URL: Allgemein)
        
        let result = Parser1.parse()
        let result2 = Parser2.parse()
        
        guard let feed = result.rssFeed, result.isSuccess else {
            print(result.error)
            return
        }
        //print(feed.title)
        
        guard let feed2 = result2.rssFeed, result.isSuccess else {
            print(result.error)
            return
        }
        
        let item = feed.items?.first
        print(item!.title!)
        main.RSSFachTitleSpeicher.append(item!.title!)
        main.RSSFachDetails.append(item!.description!)
        
        let item2 = feed2.items?.first
        print(item2!.title!)
        main.RSSAKKTitle.append(item2!.title!)
        main.RSSAKKDetai.append(item2!.description!)
        */
    }
    
    //Laden der Hochschulwebsitedaten
    func DatenDerWebsite(){
        
    }
    
}
