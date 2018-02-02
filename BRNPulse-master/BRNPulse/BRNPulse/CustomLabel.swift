//
//  CustomLabel.swift
//  BRNPulse
//
//  Created by Naveen on 2/2/18.
//  Copyright © 2018 Naveen. All rights reserved.
//

import UIKit
@IBDesignable
class CustomLabel: UILabel {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBInspectable var labelBorderWidth : CGFloat = 0 {
        didSet{
            
            layer.borderWidth = labelBorderWidth
    
        }
        
    }
    
    @IBInspectable var labelCornerRadius : CGFloat = 0 {
        didSet{
            
            layer.cornerRadius = labelCornerRadius
            layer.masksToBounds = true
        }
    }
}
