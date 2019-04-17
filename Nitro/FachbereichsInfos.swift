//
//  FachbereichsInfos.swift
//  Nitro
//
//  Created by Christian Baltzer on 25.12.18.
//  Copyright © 2018 Christian Baltzer. All rights reserved.
//

import UIKit

class FachbereichsInfos: UITableViewController {
    fileprivate let feedParser = FeedParser()
    fileprivate let feedURL = main.FachbereichLinks[main.FachbereichAuswahl]

    fileprivate var rssItems: [(title: String, description: String, pubDate: String)]?
    fileprivate var cellStates: [CellState]?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 140
        tableView.rowHeight = UITableView.automaticDimension

        tableView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine

        feedParser.parseFeed(feedURL: feedURL) { [weak self] rssItems in
            self?.rssItems = rssItems
            self?.cellStates = Array(repeating: .collapsed, count: rssItems.count)

            DispatchQueue.main.async {
                self?.tableView.reloadSections(IndexSet(integer: 0), with: .none)
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in _: UITableView) -> Int {
        return 1
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        guard let rssItems = rssItems else {
            return 0
        }
        return rssItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! NewsTableViewCell

        if let item = rssItems?[indexPath.row] {
            (cell.titleLabel.text, cell.descriptionLabel.text, cell.dateLabel.text) = (item.title, item.description, item.pubDate)

            if let cellState = cellStates?[indexPath.row] {
                cell.descriptionLabel.numberOfLines = cellState == .expanded ? 0 : 4
            }
        }

        return cell
    }

    // MARK: - Table view delegate

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let cell = tableView.cellForRow(at: indexPath) as! NewsTableViewCell

        tableView.beginUpdates()
        cell.descriptionLabel.numberOfLines = cell.descriptionLabel.numberOfLines == 4 ? 0 : 4
        cellStates?[indexPath.row] = cell.descriptionLabel.numberOfLines == 4 ? .collapsed : .expanded
        tableView.endUpdates()
    }

    // -------------------------------------------------------------------

    /*
     override func numberOfSections(in tableView: UITableView) -> Int {
     // #warning Incomplete implementation, return the number of sections
     return 1
     }

     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     // #warning Incomplete implementation, return the number of rows
     return main.RSSFachTitleSpeicher.count
     }

     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

     let item = main.RSSFachTitleSpeicher[indexPath.row]
     let button : UIButton = UIButton(type:UIButton.ButtonType.custom) as UIButton

     cell.addSubview(button)
     cell.textLabel?.text = item
     //cell.detailTextLabel = main.RSSFachDetails[indexPath.row]
     cell.accessoryType = .detailDisclosureButton

     button.tag = indexPath.row

     return cell
     }

     override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
     main.RSSCell = indexPath.row
     self.performSegue(withIdentifier: "showFach", sender: nil)
     }

     /*
      override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

      // Configure the cell...

      return cell
      }
      */

     /*
      // Override to support conditional editing of the table view.
      override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
      // Return false if you do not want the specified item to be editable.
      return true
      }
      */

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
     */
}
