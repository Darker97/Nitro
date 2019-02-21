//
//  Termine.swift
//  Nitro
//
//  Created by Christian Baltzer on 21.02.19.
//  Copyright © 2019 Christian Baltzer. All rights reserved.
//

import UIKit

class Termine: UITableViewController {

    var Title = "Test"
    
    var Trenner: [String] = ["","",""]
    var Termine:[String] = ["","",""]
    var Name: [String] = ["","",""]
    
    @IBAction func zurückButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
    }

    // MARK: - Table view data source

}
