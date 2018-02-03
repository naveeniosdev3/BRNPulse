//
//  menuSlider.swift
//  menuSlider
//
//  Created by Naveen on 1/24/18.
//  Copyright © 2018 Naveen. All rights reserved.
//

import UIKit

class menuSlider: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var profileIV: UIImageView!
    @IBOutlet weak var menuTV: UITableView!
    
    @IBOutlet weak var batchID: UILabel!
    @IBOutlet weak var studentID: UILabel!
    @IBOutlet weak var studentNameLBL: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    let menuTitles = ["Home","Daily Update","Apply Leave","Create Request"]
    let menuIcons = ["homeIcon.png","updateIcon.png","leaveIcon.png","requestIcon.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.menuTV.backgroundColor = UIColor.darkGray
        self.menuTV.delegate = self
        self.menuTV.dataSource = self
        menuTV.isScrollEnabled = false
        //profileUpdate()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
       // profileUpdate()
    }
    
//    func profileUpdate(){
//        print(DataStore.allData)
//        let imageURL = "http://www.brninfotech.com/pulse/modules"
//        let comingURL:NSString = DataStore.allData[2] as! NSString
//        
//        let modifiedURL = comingURL.replacingOccurrences(of: "..", with: imageURL)
//        
//        let imageFullURL = URL(string: modifiedURL)
//        
//        print(modifiedURL)
//        let imageDataNS : NSData = NSData(contentsOf: imageFullURL!)!
//        profileImageView.layer.cornerRadius = self.profileImageView.frame.size.width/2
//        profileImageView.layer.masksToBounds = true
//        
//        let fullName = String(format: "%@ %@",(DataStore.allData[0] as? String)!,(DataStore.allData[4] as? String)! )
//        
//        batchID?.text = DataStore.allData[3] as? String
//        studentID?.text = DataStore.allData[1] as? String
//        studentNameLBL?.text = fullName
//        profileImageView?.image = UIImage(data: imageDataNS as Data)
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return menuTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        tableView.rowHeight = 60.00
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "abc")
        
        cell.textLabel?.text = menuTitles[indexPath.row]
        cell.imageView?.image = UIImage(named: menuIcons[indexPath.row])
        cell.backgroundColor = UIColor.lightGray
        // cell.layer.cornerRadius = 10.0
        // cell.layer.masksToBounds = true
        let sView = UIView(frame: CGRect(x: 0, y: 0, width: cell.frame.size.width+250, height: 0.5))
        
        sView.backgroundColor = UIColor.gray
        cell.contentView.addSubview(sView)
        
        return cell
        
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0{
            
            //            let statusObj = self.storyboard?.instantiateViewController(withIdentifier: "status") as! DailyStatusUpdateVC
            //            let sigObj = self.storyboard?.instantiateViewController(withIdentifier: "signIn") as! SignInVC
            //
            //            CustomNavigationViewController.removeFromParentViewController(sigObj)
            //            CustomNavigationViewController.init(rootViewController: statusObj)
            
            
            let signInObj = self.storyboard?.instantiateViewController(withIdentifier: "homeNav") as! HomeScreenNavigation
            
            self.present(signInObj, animated: true, completion: nil)

            
        }else if indexPath.row == 1{
            
//            let statusUpdateObj = self.storyboard?.instantiateViewController(withIdentifier: "statusUpdate") as! StatusNavigation
//            
//            self.present(statusUpdateObj, animated: true, completion: nil)
//            let dObj = self.storyboard?.instantiateViewController(withIdentifier: "status") as! DailyStatusUpdatae!
//            let homeObj = ViewController()
//           // HomeScreenNavigation.removeFromParentViewController(homeObj)
//            //HomeScreenNavigation.init(rootViewController: dObj!)
            
            
        }else if indexPath.row == 2{
            
        }else{
            
        }
        
        
    }
    
}
