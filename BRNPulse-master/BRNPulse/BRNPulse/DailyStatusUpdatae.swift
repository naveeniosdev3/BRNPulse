//
//  DailyStatusUpdatae.swift
//  BRNPulse
//
//  Created by Naveen on 1/29/18.
//  Copyright © 2018 Naveen. All rights reserved.
//

import UIKit

class DailyStatusUpdatae: UIViewController

{
    
   
    @IBOutlet weak var attendanceTV: UITableView!
    var slideMenu : menuSlider?
    var some = true
   // var homeScreen : ViewController!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func menuButtonTap(_ sender: Any) {
        
        if some == true{
            
            openMenu()
            
        }else if some == false{
            
            closeMenu()
        }
        
    }
        
    func openMenu(){
        
        UIView.animate(withDuration: 0.6) { ()->Void in
            
            self.slideMenu?.view.frame = CGRect(x: 0, y: 60, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
                     //  self.view.frame = CGRect(x: (self.slideMenu?.view.frame.size.width)!-50, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
            
            
            self.some = false
            //self.addChildViewController(slideMenu!)
            //self.view.addSubview((self.slideMenu?.view)!)
            //self.parent?.present(self.slideMenu!, animated: true) {() -> Void in }
            
//            self.addChildViewController(self.slideMenu!)
//            self.view.addSubview(self.slideMenu!.view)
//            self.slideMenu!.didMove(toParentViewController: self)
        }
        
    }
    func closeMenu(){
        
        UIView.animate(withDuration: 0.6, animations: { ()->Void in
            
            self.slideMenu?.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 60, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
            // self.view.frame = CGRect(x: 0, y: 60, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
            
        }) {(finished) in
            self.slideMenu?.view.removeFromSuperview()
            
        }
        
        
        //        ///
        //        UIView.animate(withDuration: 0.3,animation { ()->Void in
        //
        //            self.slideMenu?.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 60, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        //            self.slideMenu.view.removeFromSuperview()
        //
        //
        //        }
        self.some = true
    }
    
}
