//
//  InfoAusgabe.swift
//  Nitro
//
//  Created by Christian Baltzer on 19.11.18.
//  Copyright © 2018 Christian Baltzer. All rights reserved.
//

import UIKit

class InfoAusgabe: UIViewController {
    @IBOutlet var text: UITextView!
    var Infos = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        var args = InfosLoader().ladeUniInfos()
        text.text = args[main.CellEins].KategorienCell[main.CellZwei].InfoCelle.Text
        // Do any additional setup after loading the view.
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
