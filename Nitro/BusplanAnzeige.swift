//
//  BusplanAnzeige.swift
//  Nitro
//
//  Created by Christian Baltzer on 07.04.19.
//  Copyright © 2019 Christian Baltzer. All rights reserved.
//

import SwiftSoup
import UIKit

class BusplanAnzeige: UITableViewController {
    var Name: [String] = []
    var Nummer: [String] = []
    var Richtung: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        htmlauswerten()
    }

    // MARK: - Table view data source

    override func numberOfSections(in _: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

     // Configure the cell...

     return cell
     }
     */

    func htmlauswerten() {
        let String_to_work_with = HardCodedVar().API_RMV_Ergebnis as Data
        let jsonData = try! JSONSerialization.jsonObject(with: String_to_work_with, options: [])
        items = jsonData as! [[String: AnyObject]]
    }
}
