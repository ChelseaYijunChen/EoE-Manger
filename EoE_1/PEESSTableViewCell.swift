//
//  PEESSTableViewCell.swift
//  EoE_1
//
//  Created by SUN on 15/11/20.
//  Copyright © 2015年 SUN. All rights reserved.
//

import UIKit

class PEESSTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var frequencyControl: UISegmentedControl!
    
    @IBOutlet weak var severityControl: UISegmentedControl!
    
    
    
    
    

}