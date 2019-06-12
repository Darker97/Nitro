//
//  Mensa.swift
//  Nitro
//
//  Created by Christian Baltzer on 12.12.18.
//  Copyright © 2018 Christian Baltzer. All rights reserved.
//

import SwiftSoup
import UIKit

class MensaCell: UITableViewCell{
    //gehört zu einer zukünftigen Funktion der Zelle
    @IBOutlet weak var NAME: UILabel!
    @IBOutlet weak var Details: UILabel!
    @IBOutlet weak var Preis: UILabel!
}

class Mensa: UITableViewController {
    var Title = "Test"
    var Name: [String] = []
    var Details: [String] = []
    var Preis: [String] = []

    @IBOutlet var NavigationBar: UINavigationItem!
    @IBAction func RefreshMensa(_ sender: UIRefreshControl) {
        Name = []
        Details = []
        Preis = []
        
        Scrapper().GetAnfrageMensa()
        Html_auswerten()
        tableView.reloadData()
        sender.endRefreshing()
    }
    
    @IBAction func zurück(_: Any) {
        dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        Html_auswerten()
        NavigationBar.title = Title
    }

    override func numberOfSections(in _: UITableView) -> Int {
        return 1
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return Name.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "CELL_MENSA"

        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? UITableViewCell

        cell!.textLabel?.text = Name[indexPath.row]
        cell!.detailTextLabel?.text = Details[indexPath.row]
        
        //Existiert ein Preis so wird er hinzugefügt, existiert keiner wird das Feld unsichtbar. Gehört zu einer Zukünftigen Funktion der Cell
        /*if let _ = Preis[exist: indexPath.row] {
            cell!.Preis.text = Preis[indexPath.row]
        }else{
            cell!.Preis.isHidden = true
        }*/
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
        
        return cell!
    }

    // ------------------------------------------------------

    func Html_auswerten() {
        var Result = main.MensaResult
        
        //Die Mensa kann auch zu sein, dann ist aber der Quellcode deutlich kleiner (kleiner als 600 Zeichen)
        if (Result.count < 600){
            Title = "geschlossen"
            Name.append("Geschlossen")
            Preis.append("")
            Details.append("")
            return
        }else
        {
        do {
            let doc: Document = try SwiftSoup.parse(Result)

            // Title der Seite
            Title = "Essen von Heute"

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
            
            Elements = try doc.select("")
            srcsStringArray = try Elements.html()
            temp2 = srcsStringArray.components(separatedBy: "\n")
            
            for parts in 0..<temp2.count{
                Preis.append(temp2[parts])
            }
        } catch {
            print ("Error")
        }
        }
        
    }
    
}

extension Collection where Indices.Iterator.Element == Index {
    subscript (exist index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
