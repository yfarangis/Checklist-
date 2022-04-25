//
//  ChecklistitemCell.swift
//  Checklists
//
//  Created by MMM on 22/04/22.
//

import UIKit

class ChecklistitemCell: UITableViewCell {

    @IBOutlet weak var tackle1: UIImageView!
    @IBOutlet weak var text1: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
