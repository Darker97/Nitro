//
//  LaunchController.swift
//  Nitro
//
//  Created by Christian Baltzer on 19.11.18.
//  Copyright © 2018 Christian Baltzer. All rights reserved.
//

import UIKit
import WebKit

/// Lädt den Loadingscreen, bereitet die Animationen vor und führt Sie aus. Ist dies geschehen wird die nächste Vew ausgeführt.
/// Lädt alle Daten die wir benötigen, gestaffelt nach zeitlicher Priorisierung

class LaunchController: UIViewController{

    @IBOutlet weak var logo: UIImageView!

    @IBOutlet weak var VersionSchrift: UILabel!

    var WurdeGeladen = false
    
    @IBOutlet weak var weba: WKWebView!
    
    
    
    /// starten der View und starten der Prozesse
    override func viewDidLoad() {
        super.viewDidLoad()
        main.Online = isOnline()
        
        ladenDerSachen();
        if (WurdeGeladen){
            self.performSegue(withIdentifier: "MenübildschirmWechsel", sender: nil)
        }
    }

    //---------------------------------------------------
    //Alles was geladen werden muss + alles was geprüft werden muss
    
    /// Lädt alle Daten die wir nachladen wollen.
    /// dynamische Daten (Mensa, Noten usw.)
    func ladenDerSachen(){
        //Alles was wir Online laden wird auch nur geladen wenn wir Online sind.
        if(main.Online){
            Täglich()
            Wöchentlich()
            Monatlich()
        }
    }
    
    
    //---------------------------------------------------
    
    /// Bildet ein Ablaufdatum für unsere Daten, sodass wir keine Daten überflüssig nachladen
    func Zeitlichedaten(){
        main.aktuelleZeit = Int(NSDate().timeIntervalSince1970)
        immer()
        
        //Beim ersten Start
        if(main.ZeitMonat == 0){
            main.ZeitMonat = main.aktuelleZeit
            main.ZeitWoche = main.aktuelleZeit
            main.ZeitTag = main.aktuelleZeit
            Täglich()
            Wöchentlich()
            Monatlich()
            return
        }
        
        if(((main.aktuelleZeit-main.ZeitMonat) / 60 / 60 / 24 ) > 30){
            Monatlich();
            main.ZeitMonat = main.aktuelleZeit
        }
        if(((main.aktuelleZeit-main.ZeitWoche) / 60 / 60 / 24) > 7){
            Wöchentlich();
            main.ZeitWoche = main.aktuelleZeit
        }
        if(((main.aktuelleZeit-main.ZeitTag) / 60 / 60 / 24) > 0){
            Täglich();
            main.ZeitTag = main.aktuelleZeit
        }
    }
    
    /// Daten die wir immer laden
    func immer(){
        DispatchQueue.main.async {
            //Noten
        }
    }
    
    
    /// Daten die wir täglich laden
    func Täglich(){
        //Termine & Essen
        main.MensaResult = Scrapper().GetAnfrageMensa(Adresse: "https://www.imensa.de/fulda/mensa-hochschule-fulda/index.html")
        //Wetter
        Weather().loadWeather()
        
    }
    
    /// Daten die wir Wöchentlich laden
    func Wöchentlich(){

    }
    
    /// Daten die wir Monatlich laden
    func Monatlich(){
        //main.TerminResult = Scrapper().GetAnfrage(Adresse: "https://www.hs-fulda.de/studieren/mein-studium/studium-organisieren/semestertermine/")
        //main.TerminResult = main.Ergebnis
    }
    
    //---------------------------------------------------
    
    
    /// prüft ob wir Online sind indem wir den Google Server anpingen.
    ///
    /// - Returns: Wir sind online, true oder false
    func isOnline() -> Bool{
        if Reachability.isConnectedToNetwork() == true {
            return true
        }
        return false
    }


    //---------------------------------------------------
    //Animation
    
    
    /// bereitet die Animation vor.
    ///
    /// - Parameter animated: wird vom System übergeben
    override func viewWillAppear(_ animated: Bool) {

        if (WurdeGeladen){
            self.performSegue(withIdentifier: "MenübildschirmWechsel", sender: nil)
        }

        let appVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as? String
        VersionSchrift.text = "Version " + appVersion!


        //Lädt das Image an eine Stelle außerhalb der View
        logo.center.x  -= view.bounds.width
    }

    
    /// startet die Animation und leitet die User Story weiter
    ///
    /// - Parameter animated: wird vom System übergeben
    override func viewDidAppear(_ animated: Bool) {
        //wischt das Logo rein
        UIView.animate(withDuration: 0.5, delay: 0.4,
                       options: [],
                       animations: {
                        self.logo.center.x += self.view.bounds.width
        },
                       completion: nil
        )
        //wartet zwei Sekunden um das Logo weider wegzuwischen
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
            UIView.animate(withDuration: 0.5, delay: 0.4,
                           options: [],
                           animations: {
                            self.logo.center.x += self.view.bounds.width
            },
                           completion: nil
            )
        })

        //warten 3 Sekunden um dann auf den nächsten Bildschrim zu wechseln.
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3), execute: {
            self.WurdeGeladen = true
            //Wenn wir nicht online sind werden wir gleich zu den Infomrationen weitergeleitet.
            //Alle anderen Funktionen benötigen eine Verbindung zum Internett und sind daher nicht zu finden.
            if(main.Online){
                self.performSegue(withIdentifier: "MenübildschirmWechsel", sender: nil)}
            else{
                self.performSegue(withIdentifier: "notOnline", sender: nil)
            }
        })

    }
    

}
