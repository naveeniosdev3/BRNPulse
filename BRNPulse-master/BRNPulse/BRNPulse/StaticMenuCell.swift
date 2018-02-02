//
//  StaticMenuCell.swift
//  BRNPulse
//
//  Created by Naveen on 1/31/18.
//  Copyright © 2018 Naveen. All rights reserved.
//

import UIKit

class StaticMenuCell: UITableViewCell {
    @IBOutlet weak var dayLabel: CustomLabel!
    @IBOutlet weak var mainView: CustomLabel!

    @IBOutlet weak var dateLabel: CustomLabel!
    @IBOutlet weak var checkOutLabel: CustomLabel!
    @IBOutlet weak var checkIn: CustomLabel!
    @IBOutlet weak var dayType: CustomLabel!
    
    @IBOutlet weak var extraTimeLabel: CustomLabel!
    @IBOutlet weak var timeSpentLabel: CustomLabel!
    
    @IBOutlet weak var totalPointsLabel: CustomLabel!
    @IBOutlet weak var staticMenuDetailsLBL: CustomLabel!
    var storeMainDict = [String:Any]()
   
    @IBOutlet weak var daysCountLabel: CustomLabel!
    @IBOutlet weak var statusButton: UIButton!
    let menuText = ["Days Count","Day","CheckIn","Check Out","Time Spent","Spent Summery","Points Earned","Status"]
    
    var storeIndex = Int()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func onStatusButtonTap(_ sender: UIButton) {
        
        
        print(storeIndex)
    }
   
    func addBorderToLabels() -> UILabel {
        
        let label = UILabel()
        label.layer.borderWidth = 1.5
        
        return label
    }
}
