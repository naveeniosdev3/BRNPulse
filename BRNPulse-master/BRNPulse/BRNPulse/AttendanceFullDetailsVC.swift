//
//  AttendanceFullDetailsVC.swift
//  BRNPulse
//
//  Created by Naveen on 1/31/18.
//  Copyright © 2018 Naveen. All rights reserved.
//

import UIKit

class AttendanceFullDetailsVC: UIViewController,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var staticTableView: UITableView!
    
    
   //@IBOutlet weak var scrollableTableView: UITableView!
    
    let menuText = ["Days Count","Day","CheckIn","Check Out","Time Spent","Spent Summery","Points Earned"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("From Full Attendance \(ForAttendanceStore.attendanceDict)")
        
        let staticCellXib = UINib(nibName: "StaticMenuCell", bundle: nil)
        staticTableView.register(staticCellXib, forCellReuseIdentifier: "abcd")
        
        
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        
            
            return ForAttendanceStore.fullAttendanceDetails.count-1
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        tableView.rowHeight = 500.00
        

            
        let cell1 = self.staticTableView.dequeueReusableCell(withIdentifier: "abcd", for: indexPath) as! StaticMenuCell
        
        print(ForAttendanceStore.valueStoreArr)
           // cell1.staticMenuDetailsLBL?.text = menuText[indexPath.row]
//        if indexPath.row == 7{
//            cell1.detailAttendanceLabel?.text = ""
//            let buttonForStatus = UIButton(type: .custom)
//            buttonForStatus.frame = CGRect(x: cell1.detailAttendanceLabel.frame.origin.x, y: 20, width: 90, height: 45)
//            buttonForStatus.setTitle("Status", for: .normal)
//            buttonForStatus.setTitleColor(UIColor.green, for: .normal)
//            buttonForStatus.addTarget(self, action: #selector(statusDisplay), for: .touchUpInside)
//            //buttonForStatus.backgroundColor = UIColor.darkGray
//            cell1.addSubview(buttonForStatus)
//        }else{
        
        ForAttendanceStore.indexRowFromDataBaseVC = UInt16(indexPath.row)
        
            //cell1.detailAttendanceLabel?.text = ForAttendanceStore.valueStoreArr[indexPath.row] as? String
            //cell1.detailAttendanceLabel?.text = ForAttendanceStore.valueStoreArr[indexPath.row] as? String
   // }
       // print("Total Table Veiw Cells ------>>\(indexPath.row)<<--------")
        return cell1
            
            
    }
   
    
    func statusDisplay(){
        
        var statusViewObj = StatusView()
         statusViewObj = self.storyboard?.instantiateViewController(withIdentifier: "statusView") as! StatusView
        
        present(statusViewObj, animated: true, completion: nil)
        
        
    }
}
