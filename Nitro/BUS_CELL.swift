//
//  BUS_CELL.swift
//  Nitro
//
//  Created by Christian Baltzer on 19.04.19.
//  Copyright © 2019 Christian Baltzer. All rights reserved.
//

import UIKit

class BUS_CELL: UITableViewCell{

    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var Zeit: UILabel!
    @IBOutlet weak var Richtung: UILabel!

    
    /*
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "cell"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: cellIdentifier)
        }
        cell?.addSubview(Name)
        cell?.addSubview(Zeit)
        cell?.addSubview(Richtung)
        
        Zeit.text = main.API_RMV_Zeit_ARRAY[indexPath.row]
        Name.text = main.API_RMV_Name_ARRAY[indexPath.row]
        Richtung.text = main.API_RMV_Richtung_ARRAY[indexPath.row]
        
        cell!.textLabel?.numberOfLines = 0
        cell!.textLabel?.lineBreakMode = .byWordWrapping
        
        return cell!
    }
    */
    
}
