//
//  AttendanceCell.swift
//  BRNPulse
//
//  Created by Naveen on 1/29/18.
//  Copyright © 2018 Naveen. All rights reserved.
//

import UIKit

class AttendanceCell: UITableViewCell {

    @IBOutlet weak var dataFromSerLBL: UILabel!
    @IBOutlet weak var subMenuLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
