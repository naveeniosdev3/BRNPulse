//
//  ViewController.swift
//  menuSlider
//
//  Created by Naveen on 1/22/18.
//  Copyright © 2018 Naveen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    var slideMenu : menuSlider!
    
    var some = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.backgroundColor = UIColor.cyan
        self.slideMenu = self.storyboard?.instantiateViewController(withIdentifier: "menuSlider") as! menuSlider
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func menuButtonTapEvent(_ sender: UIBarButtonItem) {
        
        if some == true{
            
            openMenu()
            
        }else if some == false{
            closeMenu()
            
        }
        
    }
    
    func openMenu(){
        
        UIView.animate(withDuration: 0.6) { ()->Void in
            
            self.slideMenu?.view.frame = CGRect(x: 0, y: 60, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
            //           self.view.frame = CGRect(x: (self.slideMenu?.view.frame.size.width)!-50, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
            
            
            self.some = false
            //self.addChildViewController(slideMenu!)
            self.view.addSubview(self.slideMenu!.view)
            
            
        }
        
    }
    func closeMenu(){
        
        UIView.animate(withDuration: 0.6, animations: { ()->Void in
            
            self.slideMenu?.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 60, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
            // self.view.frame = CGRect(x: 0, y: 60, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
            
        }) {(finished) in
            self.slideMenu.view.removeFromSuperview()
            
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
    
    @IBAction func swipeRight(_ sender: Any) {
        
        openMenu()
    }
    
    
    @IBAction func swipeLeft(_ sender: Any) {
        
        closeMenu()
    }
    
}

