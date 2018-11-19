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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        let appVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as? String
        VersionSchrift.text = "Version " + appVersion!
        
        //Lädt die Daten für dei Uni Infos aus der Txt Datei
        DatenLader().ladeDatenAusTxt(name: "UniInfos.txt")
        
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
