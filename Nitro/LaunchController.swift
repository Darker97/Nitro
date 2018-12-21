//
//  LaunchController.swift
//  Nitro
//
//  Created by Christian Baltzer on 19.11.18.
//  Copyright © 2018 Christian Baltzer. All rights reserved.
//

import UIKit

class LaunchController: UIViewController{
    //Lädt die erste Seite
    //Baut die Animation ein
    //Lädt alle daten und geht dann weiter
    
    @IBOutlet weak var logo: UIImageView!
    
    @IBOutlet weak var VersionSchrift: UILabel!
    
    var WurdeGeladen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toDoStuff();
        if (WurdeGeladen){
            self.performSegue(withIdentifier: "MenübildschirmWechsel", sender: nil)
        }
        
        
        // Do any additional setup after loading the view.
    }
    
    //---------------------------------------------------
    //Alles was geladen werden muss + alles was geprüft werden muss
    
    //TODO: Wipe data nach 1 Woche???
    //TODO: Laden der Mensadaten
    
    //TODO: Noten laden
    
    func toDoStuff(){
        //Lädt die Daten für dei Uni Infos aus der Txt Datei
        //DatenLader().ladeDatenAusTxt(name: "UniInfos")
        //DatenLader().ladeUniInfos()
        DatenLader().ladeEinstellungen()
        
    }

    
    //---------------------------------------------------
    //Animation
    override func viewWillAppear(_ animated: Bool) {
        
        if (WurdeGeladen){
            self.performSegue(withIdentifier: "MenübildschirmWechsel", sender: nil)
        }
        
        let appVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as? String
        VersionSchrift.text = "Version " + appVersion!
    
        
        //Lädt das Image an eine Stelle außerhalb der View
        logo.center.x  -= view.bounds.width
    }
    
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
            self.performSegue(withIdentifier: "MenübildschirmWechsel", sender: nil)
        })
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
