//
//  ViewController.swift
//  Checklists
//
//  Created by MMM on 15/04/22.
//

import UIKit


class MainViewController: UITableViewController, GroupDetailsProtocol{
    //MARK: - GroupDetailsProtocol
    func didDeleteItem(at index: Int, with grouptitle: String) {
        for (groupIndex, group) in groups.enumerated() {
            if group.title == grouptitle {
                groups[groupIndex].items.remove(at: index)
                tableView.reloadData()
            }
        }
    }
    
    //MARK: - MY DATA or data layer
    var groups: [ChecklistGroup] = [
        ChecklistGroup(title: "Birthdays", imageName: "Birthdays", items: [
            ChecklistItem(isChecked: false, name: "Amina", remindMe: true, dueDate: Date()) ]),
        ChecklistGroup(title: "Groceries", imageName: "Groceries", items: []),
                       //items: [ChecklistItem(isChecked: true, name: "Milk", remindMe: false, dueDate: nil)]),
        ChecklistGroup(title: "Appointments", imageName: "Appointments", items: [
            ChecklistItem(isChecked: true, name: "Meet Anna", remindMe: true, dueDate: Date())]),
        ChecklistGroup(title: "Chores", imageName: "Chores", items: [
            ChecklistItem(isChecked: true, name: "Tidy up the room", remindMe: false, dueDate: nil), ChecklistItem(isChecked: false, name: "Laundry", remindMe: true, dueDate: Date())])
    ]
    //MARK: - LYFE CYCLE OF VIEW CONTROLLER
    override func viewDidLoad() {
        super.viewDidLoad()
        // Subscribe to notification on creation of item
        NotificationCenter.default.addObserver(self, selector: #selector(handleAddNoteNotification), name: .noteHasBeenCreated, object: nil)
    }
    @objc
    func handleAddNoteNotification (_ notification:Notification) {
        if let object = notification.object as? (item: ChecklistItem, groupTitle: String) {
            print ("figuring out how to add new note")
            print("Received value:\(object)")
            for (index, group) in groups.enumerated() {
                if group.title == object.groupTitle {
                    groups [index].items.append(object.item)
                    tableView.reloadData()
                    print(group.items)
                }
            }
    }
    }
    //MARK: - DATA SOURCE FOR TABLE
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let group = groups [indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath) as! GroupTableViewCell
        cell.titleLabel.text = group.title
        cell.iconView.image = UIImage(named: group.imageName)
        cell.subtitle.text = group.getRemainings()
        return cell
    }
    
    //MARK: - CONNECTION OR SEGUE BETWEEN SCREENS -PEREXODY
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //segue - strelochka
        if //segue.identifier == "MainToGroupDetails",
           let vc = segue.destination as? GroupDetailsTableViewController,
           let indexPath = tableView.indexPathForSelectedRow {
            vc.title = groups[indexPath.row].title
            vc.group = groups[indexPath.row]
            vc.delegate = self
        }
    }
}


