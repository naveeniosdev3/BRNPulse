//
//  CustomCollectionViewCell.swift
//  BRNPulse
//
//  Created by Naveen on 2/1/18.
//  Copyright © 2018 Naveen. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var stautusViewButton: UIButton!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var valueAttenLabel: UILabel!
    @IBOutlet weak var menuItemsLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.green
        //self.frame.size.width = 220.00
//        self.frame.size.height = 50.00
        stautusViewButton.isHidden = true
        stautusViewButton.layer.cornerRadius = 5.0
        stautusViewButton.layer.masksToBounds = true
    }

    @IBAction func statusButtonTapEvent(_ sender: Any) {
        
        print("From Status View Button >>>>>\(ForAttendanceStore.indexRowFromDataBaseVC)<<<<<<")
    }
    
}
