//
//  AddingItemsTableViewController.swift
//  Checklists
//
//  Created by MMM on 25/04/22.
//

import UIKit

class AddingItemsTableViewController: UITableViewController {
    
    var item: ChecklistItem?
    
    var categoryName: String?
    var textFieldValue: String = ""
    var switchValue: Bool = false
    var dueDateValue: Date?
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
            cell.textPassed = { (text: String) -> Void in
                self.textFieldValue = text
            }
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SwitchCell", for: indexPath) as! SwitchCell
            cell.switchRemind.setOn(item?.remindMe ?? false, animated: true)
            cell.onSwitchChange = { (value: Bool) in
                           print("I am inside a closure")
                           self.switchValue = value
                           print("I got \(value)")
                           self.item?.remindMe = cell.switchRemind.isOn
                tableView.reloadData();
            }
            return cell
        }else{
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimeDateCell", for: indexPath) as! TimeDateCell
            cell.onDateValueChange = { date in
                self.dueDateValue = date
            }
           return cell
    }
    }
    
    @IBAction func didTapDoneButton(_ sender: Any) {
        let newItem = ChecklistItem(isChecked: true, name: textFieldValue, remindMe: switchValue, dueDate: dueDateValue)
        let object1: (ChecklistItem, String) = (newItem, categoryName ?? "No Category")
        NotificationCenter.default.post(name: .noteHasBeenCreated, object: object1)
        print (newItem)
       //we pop all view controllers on the stack
        navigationController?.popToRootViewController(animated: true)
    }
    
}
