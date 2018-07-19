//
//  TextfieldTableViewCell.swift
//  TableViewForm
//
//  Created by kede on 2018/7/19.
//  Copyright © 2018年 Clare320. All rights reserved.
//

import UIKit

class TextfieldTableViewCell: UITableViewCell {
    @IBOutlet weak var textField: UITextField!
    
    var attribute: (placeholder: String, isSecureTextEntry: Bool) = ("", false) {
        didSet {
            self.textField.placeholder = attribute.placeholder
            self.textField.isSecureTextEntry = attribute.isSecureTextEntry
        }
    }
    
    /// -- 外部获取值使用value
    var value: String? {
       return self.textField.text
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
