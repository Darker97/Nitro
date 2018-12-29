//
//  RSS Auswahl Controller.swift
//  Nitro
//
//  Created by Christian Baltzer on 28.12.18.
//  Copyright © 2018 Christian Baltzer. All rights reserved.
//

import UIKit

class RSS_Auswahl_Controller: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    //------------------------------------------------------------------------
    //zurück Button
    @IBAction func zurück(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
