//
//  Mensa.swift
//  Nitro
//
//  Created by Christian Baltzer on 12.12.18.
//  Copyright © 2018 Christian Baltzer. All rights reserved.
//

import SwiftSoup
import UIKit

class Mensa: UITableViewController {
    var Title = "Test"
    var Name: [String] = []
    var Details: [String] = []

    @IBOutlet var NavigationBar: UINavigationItem!

    @IBAction func zurück(_: Any) {
        dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        Html_auswerten()

        NavigationBar.title = Title

        tableView.estimatedRowHeight = 140
        tableView.rowHeight = UITableView.automaticDimension

        tableView.refreshControl?.backgroundColor = UIColor(red: 0.113, green: 0.113, blue: 0.145, alpha: 1)
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        tableView.refreshControl?.attributedTitle = NSAttributedString(string: "Letztes Update \(Date())", attributes: attributes)
        refreshControl?.tintColor = UIColor.white

        tableView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in _: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Name.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        // Configure the cell...

        // let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let cellIdentifier = "cell"

        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? UITableViewCell
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: cellIdentifier)
        }

        cell!.textLabel?.text = Name[indexPath.row]

        cell!.textLabel?.numberOfLines = 0
        cell!.textLabel?.lineBreakMode = .byWordWrapping

        cell!.detailTextLabel?.text = Details[indexPath.row]

        return cell!
    }

    // ------------------------------------------------------

    func Html_auswerten() {
        var Result = main.MensaResult
        do {
            let doc: Document = try SwiftSoup.parse(Result)

            // Title der Seite
            try Title = "Essen von Heute"

            var Elements = try doc.select(".artikel")
            var srcsStringArray: String = try Elements.html()
            var temp2 = srcsStringArray.components(separatedBy: "\n")
            // print(temp2)
            for j in 0 ..< temp2.count {
                var temp3 = temp2[j]

                if temp3.contains("<") {
                    let i = temp3.index(of: "<")!
                    temp2[j] = String(temp3[temp3.startIndex ..< i])
                } else {
                    temp2[j] = temp3
                }
            }

            Name = temp2

            Elements = try doc.select(".descr")
            srcsStringArray = try Elements.html()
            temp2 = srcsStringArray.components(separatedBy: "\n")

            for i in 0 ... 10 {
                temp2.append("")
            }

            var a: [String]

            for i in 0 ... 15 {
                a = temp2[i].components(separatedBy: "<")

                if a[0] != "" {
                    Details.append(a[0])
                } else {
                    Details.append("")
                }
            }

            // print(Details)
        } catch {
            Title = "geschlossen"
            Name.append("Geschlossen")
            Details.append("")
        }
    }
}
