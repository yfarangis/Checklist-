//
//  TimeDateCell.swift
//  Checklists
//
//  Created by MMM on 27/04/22.
//

import UIKit

class TimeDateCell: UITableViewCell {

    @IBOutlet weak var DatePicker: UIDatePicker!
    //create closure to pass the date on date to the other screen
    var onDateValueChange: ((Date)-> Void)?
    
    @IBOutlet weak var TimeDateCell: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func DateDidChange(_ sender: UIDatePicker) {
        print(sender.date)
        //call the closure to pass the data
        onDateValueChange? (sender.date)
    }
}
