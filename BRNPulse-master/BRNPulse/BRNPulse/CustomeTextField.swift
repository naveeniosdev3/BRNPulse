//
//  CustomTextField.swift
//  menuSlider
//
//  Created by Naveen on 1/27/18.
//  Copyright © 2018 Naveen. All rights reserved.
//

import UIKit
//import FloatingTextField
@IBDesignable
class CustomTextField: UITextField {
    
    @IBInspectable var cornerRadius : CGFloat=0{
        didSet{
            layer.cornerRadius = cornerRadius
        }
        
    }
    
    @IBInspectable var leftImage : UIImage?{
        didSet{
            updateView()
        }
    }
    
    func updateView(){
        var width = leftPadding+20
        if let image = leftImage{
            
            let imageView = UIImageView(frame: CGRect(x:leftPadding, y:2, width:20, height:20))
            leftViewMode = .always
            
            imageView.image = image
            imageView.image = image.withRenderingMode(.alwaysTemplate)
            let view = UIView(frame: CGRect(x:40, y:0, width:25, height:25))
            view.addSubview(imageView)
            //width = leftPadding+20
            leftView = view
            imageView.tintColor = tintColor
        }
        else{
            leftViewMode = .never
        }
        
        if borderStyle == UITextBorderStyle.none{
            width = width+5
        }
        
    }
    
    @IBInspectable var leftPadding : CGFloat = 0
        {
        didSet{
            updateView()
        }
    }
    @IBInspectable var placeHolderColor : UIColor = UIColor.lightGray{
        didSet {
            setValue(placeHolderColor, forKeyPath: "_placeholderLabel.textColor")
        }
    }
    
    
}
