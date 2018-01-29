//
//  ViewController.swift
//  menuSlider
//
//  Created by Naveen on 1/22/18.
//  Copyright © 2018 Naveen. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    @IBOutlet weak var attendanceTV: UITableView!
    var slideMenu : menuSlider!
    var reqURL:URLRequest?
    var sessionURL : URLSession?
    var dataTask : URLSessionDataTask?
    var allStore : [String:String]?
    var some = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.backgroundColor = UIColor.cyan
        self.slideMenu = self.storyboard?.instantiateViewController(withIdentifier: "menuSlider") as! menuSlider
        
        attendanceTV?.delegate = self
        attendanceTV?.dataSource = self
        //attendanceTV.register(AttendanceCell(), forCellReuseIdentifier: "abc")
        let attendanceCellxib = UINib(nibName: "AttendanceCell", bundle: nil)
        attendanceTV.register(attendanceCellxib, forCellReuseIdentifier: "abc")
        
        let multi = DispatchQueue(label: "some",qos:.utility)
        multi.async {
            
            self.loadAttendanceDetails()
        }
        
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
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "abc", for: indexPath) as! AttendanceCell
        
        cell.subMenuLabel?.text = "Attendance"
        cell.dataFromSerLBL?.text = "1234567890"
        
        return cell
        
    }
    
    
    func loadAttendanceDetails(){
        
        let add = "http://www.brninfotech.com/pulse/modules/admin/DashboardSnippets.php"
        sessionURL = URLSession(configuration: URLSessionConfiguration.default)
        reqURL = URLRequest(url: URL(string: add)!)
        
        reqURL?.httpMethod = "POST"
        
       
        
        let dataToServer = "funcName=getUserAttendance&studentIDByAdmin=NoValue"
        reqURL?.httpBody = dataToServer.data(using: .utf8)
        dataTask = sessionURL?.dataTask(with: reqURL!, completionHandler: { (data, response, error) in
            print(data!)
            do{
                let dataResult = try JSONSerialization.jsonObject(with: data!, options:[])
                //print(dataResult)
                
                self.allStore = dataResult as? [String : String]
               
                print(dataResult)
                //print(self.allStore!)
            }catch{
                
                print("Something gone wrong")
            }
        })
        dataTask?.resume()

        
    }
    
    
    
    
}

