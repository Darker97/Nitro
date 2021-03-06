//
//  InfoAuflistung.swift
//  Nitro
//
//  Created by Christian Baltzer on 19.11.18.
//  Copyright © 2018 Christian Baltzer. All rights reserved.
//

import UIKit

class InfoAuflistung: UITableViewController {
    // ---------------------------------------------------

    var Infos = [String]()
    @IBOutlet var zurückButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()

        if main.Online != true {
            zurückButton.isEnabled = false
            zurückButton.accessibilityElementsHidden = true
            
            let alert = UIAlertController(title: "Achtung", message: "Keine Verbindung zum Internet möglich", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
            
        }

        // abrufen der Daten und befüllen des Arrays
        var args = InfosLoader().ladeUniInfos()

        for i in 0 ... args.count - 1 {
            Infos.append(args[i].Name)
        }
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

        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
        
        return cell
    }

    override func tableView(_: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        main.CellEins = indexPath.row
        performSegue(withIdentifier: "MoreInfos", sender: nil)
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

    // ------------------------------------------------------------------------
    // zurück Button
    @IBAction func zutück(_: Any) {
        dismiss(animated: true, completion: nil)
    }
}
