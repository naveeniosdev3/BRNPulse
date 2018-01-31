//
//  StatusView.swift
//  BRNPulse
//
//  Created by Naveen on 1/31/18.
//  Copyright © 2018 Naveen. All rights reserved.
//

import UIKit

class StatusView: UIViewController {

    @IBOutlet weak var scrollViewStatus: UIScrollView!
    
    @IBOutlet weak var nineToTenLBL: UILabel!
    
    @IBOutlet weak var tenToLeven: UILabel!
    @IBOutlet weak var elevenToTwelve: UILabel!
    
    @IBOutlet weak var twelveToOne: UILabel!
    @IBOutlet weak var oneToTwo: UILabel!
    @IBOutlet weak var twoToThree: UILabel!
    @IBOutlet weak var threeToFour: UILabel!
    @IBOutlet weak var fourToFive: UILabel!
    @IBOutlet weak var fiveToSix: UILabel!
    
    @IBOutlet weak var sixAfter: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        modifyScrollView()
       // self.view.backgroundColor = UIColor.clear
        print("Status is :\(ForAttendanceStore.forStatusDict)")
    
        var arr = [String]()
        
        for (key, value) in ForAttendanceStore.forStatusDict {
            arr.append("\(key) \(value)")
        }
        
        nineToTenLBL?.text = arr[0]
        tenToLeven?.text = arr[1]
        elevenToTwelve?.text = arr[2]
        
//        nineToTenLBL?.text = "id some thing aefjdsjf enidjfdsej jdfejk ejfkje3ej ejejrejjekljewj"
//        //nineToTenLBL?.text = ForAttendanceStore.forStatusDict["nineToTen"]
//        tenToLeven?.text = ForAttendanceStore.forStatusDict["tenToEleven"]
//        elevenToTwelve?.text = ForAttendanceStore.forStatusDict["elevenToTwelve"]
//        twoToThree?.text = ForAttendanceStore.forStatusDict["twelveToOne"]
//        twelveToOne?.text = ForAttendanceStore.forStatusDict["oneToTwo"]
//        oneToTwo?.text = ForAttendanceStore.forStatusDict["twoToThree"]
//        threeToFour?.text = ForAttendanceStore.forStatusDict["threeToFour"]
//        fourToFive?.text = ForAttendanceStore.forStatusDict["fourToFive"]
//        fiveToSix?.text = ForAttendanceStore.forStatusDict["fiveToSix"]
//        sixAfter?.text = ForAttendanceStore.forStatusDict["sixAndAbove"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func modifyScrollView(){
        
        scrollViewStatus.layer.borderWidth = 2.0
        scrollViewStatus.layer.cornerRadius = 10.0
        scrollViewStatus.layer.masksToBounds = true
       // scrollViewStatus.layer.borderColor = (UIColor.lightGray as! CGColor)
    }
   
    
    @IBAction func onTapGetsureEvent(_ sender: UITapGestureRecognizer) {
        
        dismiss(animated: true, completion: nil)
    }
    
}
