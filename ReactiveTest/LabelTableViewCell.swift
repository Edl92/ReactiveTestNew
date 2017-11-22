//
//  LabelTableViewCell.swift
//  ReactiveTest
//
//  Created by Wind3 on 22/11/2017.
//  Copyright © 2017 Wind3. All rights reserved.
//

import UIKit
import ExpandableLabel

class LabelTableViewCell: UITableViewCell {

    
    @IBOutlet weak var label:ExpandableLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.label.numberOfLines = 3
        
        
//        label.collapsed = true
//        
//        label.collapsedAttributedLink = NSAttributedString(string: "Read More")
//        label.expandedAttributedLink = NSAttributedString(string: "Read Less")
//
//        label.ellipsis = NSAttributedString(string: "...")
//        label.shouldCollapse = true
//        label.shouldExpand = true

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
