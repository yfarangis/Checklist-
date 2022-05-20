//
//  TextFieldCell.swift
//  Checklists
//
//  Created by MMM on 25/04/22.
//

import UIKit

class TextFieldCell: UITableViewCell {

    var textPassed: ((String) -> Void)?
    
    @IBOutlet weak var textField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


        // Configure the view for the selected state
    }

    @IBAction func TextFieldDidChange(_ sender: UITextField) {
        if let text = sender.text {
            textPassed?(text)
        }
    }
}
//TO DO
// 1 - to create a closure to pass String ((string) -> void)?
//2 - to pass text from textfield to closure
//3 -obrabotat closure na drugom ekrane
