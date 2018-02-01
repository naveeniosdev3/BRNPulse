//
//  AttendanceFullDetailsVC.swift
//  BRNPulse
//
//  Created by Naveen on 1/31/18.
//  Copyright © 2018 Naveen. All rights reserved.
//

import UIKit

class AttendanceFullDetailsVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var staticTableView: UITableView!
    
    
   //@IBOutlet weak var scrollableTableView: UITableView!
    
    let menuText = ["Days Count","Day","CheckIn","Check Out","Time Spent","Spent Summery","Points Earned"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //staticTableView?.dataSource = self
        print("From Full Attendance \(ForAttendanceStore.attendanceDict)")
        
        let staticCellXib = UINib(nibName: "StaticMenuCell", bundle: nil)
        staticTableView.register(staticCellXib, forCellReuseIdentifier: "abcd")
        
        ForAttendanceStore.fullAttendanceDetails.remove(at: 0)
        
        print(ForAttendanceStore.fullAttendanceDetails)
    //ForAttendanceStore.fullAttendanceDetails = dStore
       

        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        
            
            return ForAttendanceStore.fullAttendanceDetails.count
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        tableView.rowHeight = 500.00
//        print(ForAttendanceStore.fullDictByIndex)
//        print(ForAttendanceStore.fullDictByIndex["attendanceDate"]!)

            
        let cell1 = self.staticTableView.dequeueReusableCell(withIdentifier: "abcd", for: indexPath) as! StaticMenuCell
        
            print(ForAttendanceStore.valueStoreArr)
            ForAttendanceStore.indexRowFromDataBaseVC = UInt16(indexPath.row)
        
        ForAttendanceStore.fullDictByIndex = ForAttendanceStore.fullAttendanceDetails[indexPath.row] as! [String : Any]
        print(ForAttendanceStore.fullDictByIndex)
        print(ForAttendanceStore.fullDictByIndex["attendanceDate"]!)
        ForAttendanceStore.attendanceDate = ForAttendanceStore.fullDictByIndex["attendanceDate"]! as! String
        ForAttendanceStore.attendanceDay = ForAttendanceStore.fullDictByIndex["attendanceDay"]! as! String
        ForAttendanceStore.extraHours = ForAttendanceStore.fullDictByIndex["shortageExcessTime"]! as! String

        ForAttendanceStore.checkIn = ForAttendanceStore.fullDictByIndex["checkIn"]! as! String

        ForAttendanceStore.checkOut = ForAttendanceStore.fullDictByIndex["checkOut"]! as! String

        ForAttendanceStore.timeSpent = ForAttendanceStore.fullDictByIndex["timeSpent"]! as! String
        //ForAttendanceStore.totalPoints = ForAttendanceStore.fullDictByIndex["totalPoints"]! as! String

    
        
        return cell1
            
            
    }
   
    
}
