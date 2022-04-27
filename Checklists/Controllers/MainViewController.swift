//
//  ViewController.swift
//  Checklists
//
//  Created by MMM on 15/04/22.
//

import UIKit

class MainViewController: UITableViewController {
    let groups: [ChecklistGroup] = [
        ChecklistGroup(title: "Brithdays", imageName: "Birthdays", items: [
            ChecklistItem(isChecked: true, name: "Amina's BD") ])
        
        // ChecklistGroup(title: "Groceries", imageName: "Groceries"),
        // ChecklistGroup(title: "Appointments", imageName: "Appointments"),
        // ChecklistGroup(title: "Chores", imageName: "Chores")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let group = groups [indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath) as! GroupTableViewCell
        cell.titleLabel.text = group.title
        cell.iconView.image = UIImage(named: group.imageName)
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //segue - strelochka
        if segue.identifier == "MainToGroupDetails",
           let vc = segue.destination as? GroupDetailsTableViewController,
           let indexPath = tableView.indexPathForSelectedRow {
                vc.items = groups[indexPath.row].items
        }
    }
}

