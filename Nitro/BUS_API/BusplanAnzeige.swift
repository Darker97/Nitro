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

    @IBAction func Refresh(_ sender: UIRefreshControl) {
        main.API_RMV_Zeit_ARRAY     = []
        main.API_RMV_Name_ARRAY     = []
        main.API_RMV_Richtung_ARRAY = []
        
        Scrapper().getBus()
        htmlauswerten()
        tableView.reloadData()
        sender.endRefreshing()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        htmlauswerten()
        }
    
    // MARK: - Table view data source

    override func numberOfSections(in _: UITableView) -> Int {
        return 1
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return main.API_RMV_Zeit_ARRAY.count
    }

    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "cell"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? BUS_CELL
        
        cell?.Zeit.text = main.API_RMV_Zeit_ARRAY[indexPath.row]
        cell?.Name.text = main.API_RMV_Name_ARRAY[indexPath.row]
        cell?.Richtung.text = main.API_RMV_Richtung_ARRAY[indexPath.row]
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
        
        return cell!
     }
    
    func htmlauswerten() {
        let Data_to_work_with = main.API_RMV_Ergebnis
        let decoder = JSONDecoder()
        do{
            let Test = try decoder.decode(BusplanStruc.self, from: Data_to_work_with!)
            for infos in Test.journey{
                main.API_RMV_Name_ARRAY.append(infos.mot.name.html2String)
                main.API_RMV_Zeit_ARRAY.append(infos.time)
                main.API_RMV_Richtung_ARRAY.append(infos.direction.html2String)
            }
        } catch {
            print (error)
        }
    }
}


class BUS_CELL: UITableViewCell{
    
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var Zeit: UILabel!
    @IBOutlet weak var Richtung: UILabel!
}


extension Data {
    var html2AttributedString: NSAttributedString? {
        do {
            return try NSAttributedString(data: self, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            print("error:", error)
            return  nil
        }
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
}

extension String {
    var html2AttributedString: NSAttributedString? {
        return Data(utf8).html2AttributedString
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
}
