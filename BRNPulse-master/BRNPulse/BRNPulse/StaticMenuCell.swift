//
//  StaticMenuCell.swift
//  BRNPulse
//
//  Created by Naveen on 1/31/18.
//  Copyright © 2018 Naveen. All rights reserved.
//

import UIKit

class StaticMenuCell: UITableViewCell {

    @IBOutlet weak var staticMenuDetailsLBL: UILabel!
    
    @IBOutlet weak var detailAttendanceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
