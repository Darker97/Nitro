//
//  InfoAuflistung.swift
//  Nitro
//
//  Created by Christian Baltzer on 19.11.18.
//  Copyright © 2018 Christian Baltzer. All rights reserved.
//

import UIKit

class KategorienAuflistung: UITableViewController {
    var Infos = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // abrufen der Daten und befüllen des Arrays
        var args = InfosLoader().ladeUniInfos()
        var temp = args[main.CellEins].KategorienCell

        // print(temp)

        for i in 0 ... temp.count - 1 {
            Infos.append(temp[i].Name)
        }
        tableView.reloadSections(IndexSet(integer: 0), with: .none)
    }

    // MARK: - Table view data source

    override func numberOfSections(in _: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Infos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let item = Infos[indexPath.row]
        let button: UIButton = UIButton(type: UIButton.ButtonType.custom) as UIButton
        // let button = cell.viewWithTag(indexPath.row) as! UIButton

        cell.addSubview(button)
        cell.textLabel?.text = item

        cell.accessoryType = .detailDisclosureButton

        button.tag = indexPath.row

        return cell
    }

    override func tableView(_: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        main.CellZwei = indexPath.row
        performSegue(withIdentifier: "ShowDetail", sender: nil)
    }

    // Override to support conditional editing of the table view.
    override func tableView(_: UITableView, canEditRowAt _: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }

    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */

    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

     }
     */

    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */

    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
}
