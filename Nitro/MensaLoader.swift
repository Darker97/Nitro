//
//  MensaLoader.swift
//  Nitro
//
//  Created by Christian Baltzer on 28.12.18.
//  Copyright © 2018 Christian Baltzer. All rights reserved.
//

import UIKit
import WebKit

class MensaLoader: UIViewController {

    //Falls das Laden am Anfang nicht funktioniert hat holen wir es hier nach.
    
    @IBOutlet weak var web: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        if(main.MensaEssen.count == 0){
            Scrapper().MensaData(Webview: web!)
            performSegue(withIdentifier: "next", sender: nil)
        }
        performSegue(withIdentifier: "next", sender: nil)*/
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        if(main.MensaEssen.count == 0){
            Scrapper().MensaData(Webview: web!)
            performSegue(withIdentifier: "next", sender: nil)
        }
        performSegue(withIdentifier: "next", sender: nil)
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
