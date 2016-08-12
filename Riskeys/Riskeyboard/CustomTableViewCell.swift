//
//  CustomTableViewCell.swift
//  Riskeys
//
//  Created by Carol Zhang on 8/12/16.
//  Copyright © 2016 Carol Zhang. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var phraseLabel: UILabel!
    var hi = "hi"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
