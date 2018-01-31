//
//  AttendanceCell.swift
//  BRNPulse
//
//  Created by Naveen on 1/29/18.
//  Copyright © 2018 Naveen. All rights reserved.
//

import UIKit

class AttendanceCell: UITableViewCell {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var dataFromSerLBL: UILabel!
    @IBOutlet weak var subMenuLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = UIColor.clear
        
//        subMenuLabel.backgroundColor = UIColor.lightText
//        dataFromSerLBL.backgroundColor = UIColor.lightText
        
        dataFromSerLBL.layer.cornerRadius = 4.0
        dataFromSerLBL.layer.masksToBounds = true
        
        subMenuLabel.layer.cornerRadius = 4.0
        subMenuLabel.layer.masksToBounds = true
        
        //self.frame.size.height = 60
        // Initialization code
        
        let viewForS = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: 0))
        viewForS.backgroundColor = UIColor.clear
        self.contentView.addSubview(viewForS)
        
        bgView.layer.cornerRadius = 15.0
        bgView.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
