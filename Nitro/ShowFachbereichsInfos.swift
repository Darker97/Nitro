//
//  ShowFachbereichsInfos.swift
//  Nitro
//
//  Created by Christian Baltzer on 25.12.18.
//  Copyright © 2018 Christian Baltzer. All rights reserved.
//

import UIKit

class ShowFachbereichsInfos: UIViewController {

    @IBOutlet weak var Titel: UILabel!
    @IBOutlet weak var text: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        Titel.text = main.RSSFachTitleSpeicher[main.RSSCell]
        text.text = main.RSSFachDetails[main.RSSCell]
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
