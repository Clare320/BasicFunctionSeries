//
//  ButtonTableViewCell.swift
//  TableViewForm
//
//  Created by kede on 2018/7/19.
//  Copyright © 2018年 Clare320. All rights reserved.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {

    @IBOutlet weak var button: UIButton!
    
    var title: String? {
        didSet {
            self.button.setTitle(title, for: .normal)
        }
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
