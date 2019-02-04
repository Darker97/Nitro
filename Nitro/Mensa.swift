//
//  Mensa.swift
//  Nitro
//
//  Created by Christian Baltzer on 12.12.18.
//  Copyright © 2018 Christian Baltzer. All rights reserved.
//

import UIKit
import SwiftSoup

class Mensa: UITableViewController {
    
    var Title = "Test"
    var Name: [String] = []
    var Details: [String] = []
    
    @IBOutlet weak var NavigationBar: UINavigationItem!
    
    @IBAction func zurück(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Html_auswerten()
        
        NavigationBar.title = Title
        
        tableView.estimatedRowHeight = 140
        tableView.rowHeight = UITableView.automaticDimension
        


        tableView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Name.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        // Configure the cell...
        
        //let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let cellIdentifier = "cell"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? UITableViewCell
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: cellIdentifier)
        }
        
        
        cell!.textLabel?.text = Name[indexPath.row]
        
        cell!.textLabel?.numberOfLines = 0;
        cell!.textLabel?.lineBreakMode = .byWordWrapping
        
        cell!.detailTextLabel?.text = Details[indexPath.row]
        
        return cell!
    }
 
    
    func Html_auswerten(){
        var Result = main.MensaResult
        do{
            let doc: Document = try SwiftSoup.parse(Result)
        
            //Title "class = aw-menu-title"             .aw-menu-title
            //Name "class = aw-meal-description"
            //Details "title="Preis für Studierende""
            
            //Title der Seite Ausschneiden
            try Title = doc.select(".aw-menu-title").text()
            var temp = Title.components(separatedBy: " ")
            Title = String(temp[0] + " " + temp[1] + " " + temp[2])
            
            
            var Elements = try doc.select(".aw-meal-description")
            var srcsStringArray: String = try Elements.html()
            var temp2 = srcsStringArray.components(separatedBy: "\n")
            Name = temp2
            
            Elements = try doc.select(".aw-meal-price")
            srcsStringArray = try Elements.html()
            temp2 = srcsStringArray.components(separatedBy: "\n")
            
            for i in 0...10{
                temp2.append("")
            }
            
            var a: [String]
            
            for i in 0...15{
                a = temp2[i].components(separatedBy: "&")
               
                if(a[0] != ""){
                    Details.append(a[0] + " €")
                }else{
                    Details.append("")
                }
            }
            
            //print(Details)
        }
        catch{
            Title = "geschlossen"
            Name.append("Geschlossen")
            Details.append("")
        }
        
    }

}
