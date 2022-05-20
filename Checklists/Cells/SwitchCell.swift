//
//  SwitchCell.swift
//  Checklists
//
//  Created by MMM on 25/04/22.
//

import UIKit

class SwitchCell: UITableViewCell {

    var onSwitchChange: ((Bool) -> Void)?
  
    @IBOutlet weak var switchRemind: UISwitch!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func SwitchDidChange(_ sender: UISwitch) {
        print("switch value:\(sender.isOn)")
        onSwitchChange?(sender.isOn)
    }
}


