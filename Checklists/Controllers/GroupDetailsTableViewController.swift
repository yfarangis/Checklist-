//
//  GroupDetailsTableViewController.swift
//  Checklists
//
//  Created by MMM on 22/04/22.
//

import UIKit

class GroupDetailsTableViewController: UITableViewController {
    var group: ChecklistGroup!
    var delegate: GroupDetailsProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return group.items.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistitemCell", for: indexPath) as! ChecklistitemCell
        
        let item = group.items[indexPath.row]
        cell.tackle1.isHidden = !item.isChecked
        cell.text1.text = item.name
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //segue - strelochka
        if segue.identifier == "GroupDetailstoAddingItem",
           let vc = segue.destination as? AddingItemsTableViewController,
           let indexPath = tableView.indexPathForSelectedRow {
            vc.title = "Edit Item"
            vc.item  = group.items[indexPath.row]
        }
        
        if segue.identifier == "JumpToAddNewItem" {
            let vc = segue.destination as? AddingItemsTableViewController
            vc?.categoryName = group.title
        }
    }
    
    //MARK: - UI TABLE VIEW DELEGATE
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected button\(indexPath.row)")
    }
    override func tableView(_ tableView: UITableView, commit editingStyle:
                   UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        //delete data from array
        group.items.remove(at:indexPath.row)
        
        //delete a cell from the table
        tableView.deleteRows(at: [indexPath], with: .automatic )
        delegate?.didDeleteItem(at: indexPath.row, with: group.title)
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
