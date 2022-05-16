//
//  AddingItemsTableViewController.swift
//  Checklists
//
//  Created by MMM on 25/04/22.
//

import UIKit

class AddingItemsTableViewController: UITableViewController {
    
    var item: ChecklistItem?
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
   
    }

    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TextFieldCell", for: indexPath) as! TextFieldCell
            cell.textField.text = item?.name
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SwitchCell", for: indexPath) as! SwitchCell
            return cell
        }else{
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimeDateCell", for: indexPath) as! TimeDateCell
           return cell
    }
    }
    
    @IBAction func didTapDoneButton(_ sender: Any) {
        let newItem = ChecklistItem(isChecked: <#T##Bool#>, name: <#T##String#>, remindMe: <#T##Bool#>)
        NotificationCenter.default.post(name: .noteHasBeenCreated, object: nil)
    }
    
}
