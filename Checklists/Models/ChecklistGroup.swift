//
//  ChecklistGroup.swift
//  Checklists
//
//  Created by MMM on 18/04/22.
//

import Foundation
struct ChecklistGroup {
    let title: String
    let imageName: String
    var items: [ChecklistItem]
    
    func getRemainings()-> String {
        //TO DO
        // all done
        var isAllDone = true
        for item in items {
            if item.isChecked != true {
                isAllDone = false
            }
        }
        if items.isEmpty {
        return "(No items)"
        }else if !isAllDone, items.count != 0 {
            return "\(items.count) Remaining"
        }
            if isAllDone {
            return "All done"
        }else{
            return "Incorrect data"
          
        }
    }
}
