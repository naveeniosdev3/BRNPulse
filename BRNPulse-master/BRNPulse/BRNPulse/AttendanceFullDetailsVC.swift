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
    
    //let menuText = ["Days Count","Day","CheckIn","Check Out","Time Spent","Spent Summery","Points Earned"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //staticTableView?.dataSource = self
        print("From Full Attendance \(ForAttendanceStore.attendanceDict)")
        
        let staticCellXib = UINib(nibName: "StaticMenuCell", bundle: nil)
        staticTableView.register(staticCellXib, forCellReuseIdentifier: "abcd")
        
        
        
        print(ForAttendanceStore.fullAttendanceDetails)
    //ForAttendanceStore.fullAttendanceDetails = dStore
       

        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        
            
            return ForAttendanceStore.fullAttendanceDetails.count
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        tableView.rowHeight = 580.00
//        print(ForAttendanceStore.fullDictByIndex)
//        print(ForAttendanceStore.fullDictByIndex["attendanceDate"]!)

            
        let cell1 = self.staticTableView.dequeueReusableCell(withIdentifier: "abcd", for: indexPath) as! StaticMenuCell
        //cell1.arrStore.removeAll()
            print(ForAttendanceStore.valueStoreArr)
            ForAttendanceStore.indexRowFromDataBaseVC = UInt16(indexPath.row)
    
        ForAttendanceStore.fullDictByIndex = ForAttendanceStore.fullAttendanceDetails[indexPath.row] as! [String : Any]
       // print(ForAttendanceStore.fullDictByIndex)
        print(ForAttendanceStore.fullDictByIndex["attendanceDay"]!)
        
        cell1.dateLabel?.text = ForAttendanceStore.fullDictByIndex["attendanceDate"]! as? String
        cell1.dayLabel?.text = ForAttendanceStore.fullDictByIndex["attendanceDay"]! as? String
        print(ForAttendanceStore.fullDictByIndex["attendanceDay"]!)
        cell1.dayType?.text = ForAttendanceStore.fullDictByIndex["dayType"]! as? String
        cell1.checkIn?.text = ForAttendanceStore.fullDictByIndex["checkIn"]! as? String
        cell1.checkOutLabel?.text = ForAttendanceStore.fullDictByIndex["checkOut"]! as? String

       cell1.timeSpentLabel?.text = ForAttendanceStore.fullDictByIndex["shortageExcessTime"]! as? String

       cell1.extraTimeLabel?.text = ForAttendanceStore.fullDictByIndex["timeSpent"]! as? String
        cell1.totalPointsLabel?.text = String(describing: ForAttendanceStore.fullDictByIndex["totalPoints"]!)
        cell1.daysCountLabel?.text = String(describing: ForAttendanceStore.fullDictByIndex["attendanceDayCount"]!)
        //ForAttendanceStore.totalPoints = ForAttendanceStore.fullDictByIndex["totalPoints"]! as! String
        
        let someVar:String = String(describing: ForAttendanceStore.fullDictByIndex["dailyActivityUpdate"]!)
        print(someVar)
        if (someVar == "0") {
            print("Its a Bool")
            ForAttendanceStore.forStatusDict = ["elevenToTwelve" : "Holiday, No Status","fiveToSix" : "Holiday, No Status",
                                                "fourToFive" : "Holiday, No Status",
                                                "nineToTen" : "Holiday, No Status",
                                                "oneToTwo" : "Holiday, No Status",
                                                "sixAndAbove" : "Holiday, No Status",
                                                "tenToEleven" : "Holiday, No Status",
                                                "threeToFour" : "Holiday, No Status",
                                                "twelveToOne" : "Holiday, No Status",
                                                "twoToThree" : "Holiday, No Status"]
            print(ForAttendanceStore.forStatusDict)
        }else if(someVar == "1"){
            
            ForAttendanceStore.forStatusDict = ["elevenToTwelve" : "No Status","fiveToSix" : "No Status",
                                                "fourToFive" : "No Status",
                                                "nineToTen" : "No Status",
                                                "oneToTwo" : "No Status",
                                                "sixAndAbove" : "No Status",
                                                "tenToEleven" : "No Status",
                                                "threeToFour" : "No Status",
                                                "twelveToOne" : "No Status",
                                                "twoToThree" : "No Status"]
            
            print(ForAttendanceStore.forStatusDict)
        }
        else{
            print(ForAttendanceStore.fullDictByIndex["dailyActivityUpdate"]!)
        ForAttendanceStore.forStatusDict =  ForAttendanceStore.fullDictByIndex["dailyActivityUpdate"] as! [String : String]
        }
        print(ForAttendanceStore.fullDictByIndex["dailyActivityUpdate"]!)
        cell1.storeIndex = indexPath.row
    
        cell1.layer.borderWidth = 2.0
        cell1.statusButton.addTarget(self, action: #selector(statusButtonEvent), for: .touchUpInside)
        return cell1
        
            
    }
    
    func statusButtonEvent(){
        
        var statusViewObj = StatusView()
        
        statusViewObj = self.storyboard?.instantiateViewController(withIdentifier: "statusView")  as! StatusView
        
        present(statusViewObj, animated: true, completion: nil)
    }
    
}
