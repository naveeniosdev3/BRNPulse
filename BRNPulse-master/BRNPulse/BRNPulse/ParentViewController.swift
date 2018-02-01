//
//  ParentViewController.swift
//  BRNPulse
//
//  Created by Naveen on 1/30/18.
//  Copyright © 2018 Naveen. All rights reserved.
//

import UIKit

class ParentViewController: UIViewController {

    lazy var homeScreen : ViewController = {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        var vc = storyBoard.instantiateViewController(withIdentifier: "HomeScreenVC") as! ViewController
        
        self.addViewControllerAsChildViewController(childViewController: vc)
        
        return vc
    }()
    
    lazy var statusScreen : DailyStatusUpdatae = {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        var ss = storyBoard.instantiateViewController(withIdentifier: "status") as! DailyStatusUpdatae
        
   self.addViewControllerAsChildViewController(childViewController: ss)
        
        return ss
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    private func setUpView()
    {
        
    }
    
    private func updateView()
    {
        
    }

    @IBAction func onMenuButtonTapEvent(_ sender: UIBarButtonItem) {
    }
    
    
    private func addViewControllerAsChildViewController(childViewController: UIViewController){
        
        view.addSubview(childViewController.view)
        childViewController.view.frame = view.bounds
        childViewController.view.autoresizingMask = [.flexibleWidth , .flexibleHeight]
        childViewController.didMove(toParentViewController: self)
    }
}
