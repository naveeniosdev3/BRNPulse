//
//  ParentViewController.swift
//  BRNPulse
//
//  Created by Naveen on 1/30/18.
//  Copyright © 2018 Naveen. All rights reserved.
//

import UIKit

class ParentViewController: UIViewController {

    var some = true
    var slideMenu : menuSlider!
    lazy var homeScreen : menuSlider = {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        var vc = storyBoard.instantiateViewController(withIdentifier: "menuSlider") as! menuSlider
        
        //self.addViewControllerAsChildViewController(childViewController: vc)
        
        return vc
    }()
    
    lazy var statusScreen : DailyStatusUpdatae = {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        var ss = storyBoard.instantiateViewController(withIdentifier: "status") as! DailyStatusUpdatae
        
   //self.addViewControllerAsChildViewController(childViewController: ss)
        
        return ss
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setUpView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    private func setUpView()
    {
        
        view.addSubview(homeScreen.view)
        homeScreen.view.frame = view.bounds
        homeScreen.view.autoresizingMask = [.flexibleWidth , .flexibleHeight]
        homeScreen.didMove(toParentViewController: self)

        
    }
    
    private func updateView()
    {
        
    }

    @IBAction func onMenuButtonTapEvent(_ sender: UIBarButtonItem) {
    }
    
    
//    private func addViewControllerAsChildViewController(childViewController: UIViewController){
//        
//        view.addSubview(childViewController.view)
//        childViewController.view.frame = view.bounds
//        childViewController.view.autoresizingMask = [.flexibleWidth , .flexibleHeight]
//        childViewController.didMove(toParentViewController: self)
//    }
    
    @IBAction func menuButtonTapEvent(_ sender: UIBarButtonItem) {
        
        if some == true{
            setUpView()
            openMenu()
            
        }else if some == false{
            closeMenu()
            
        }
        
    }
    
    func openMenu(){
        
        UIView.animate(withDuration: 1) { ()->Void in
            
//            self.slideMenu!.view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
//            //           self.view.frame = CGRect(x: (self.slideMenu?.view.frame.size.width)!-50, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
//            
//            
//            self.some = false
//            self.addChildViewController(self.slideMenu)
//            self.navigationController?.setNavigationBarHidden(true, animated: true)
//            self.view.addSubview(self.slideMenu.view)
            //self.view.bringSubview(toFront: self.slideMenu!.view)
//            view.addSubview(homeScreen.view)
//            homeScreen.view.frame = view.bounds
//            homeScreen.view.autoresizingMask = [.flexibleWidth , .flexibleHeight]
//            homeScreen.didMove(toParentViewController: self)

            
        }
        
    }
    func closeMenu(){
        
        UIView.animate(withDuration: 1, animations: { ()->Void in
            
            self.slideMenu.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
            // self.view.frame = CGRect(x: 0, y: 60, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
            self.navigationController?.setNavigationBarHidden(false, animated: true)
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
