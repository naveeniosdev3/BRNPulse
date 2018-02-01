//
//  StaticMenuCell.swift
//  BRNPulse
//
//  Created by Naveen on 1/31/18.
//  Copyright © 2018 Naveen. All rights reserved.
//

import UIKit

class StaticMenuCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource {

    @IBOutlet weak var staticMenuDetailsLBL: UILabel!
    var storeMainDict = [String:Any]()
    @IBOutlet weak var collectionViewRow: UICollectionView!
    @IBOutlet weak var detailAttendanceLabel: UILabel!
    let menuText = ["Days Count","Day","CheckIn","Check Out","Time Spent","Spent Summery","Points Earned","Status"]
    
    var arrStore = [Any]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        
       
        
        collectionViewRow.delegate = self
        collectionViewRow.dataSource =  self
        
        let cellItemXib = UINib(nibName: "CustomCollectionViewCell", bundle: nil)
        collectionViewRow.register(cellItemXib, forCellWithReuseIdentifier: "item")
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 8
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
            
        
        
        let cellItem = collectionViewRow.dequeueReusableCell(withReuseIdentifier: "item", for: indexPath)   as! CustomCollectionViewCell
        cellItem.frame.size.width = self.bounds.size.width
        cellItem.frame.size.height = 60.00
        cellItem.menuItemsLabel?.text = menuText[indexPath.row]
        
        print(ForAttendanceStore.indexRowFromDataBaseVC)
        
        
        
        if indexPath.row == 0{
            
            //print("from Arr Store\(arrStore)")
            cellItem.valueAttenLabel.isHidden = false
            cellItem.valueAttenLabel?.text = ForAttendanceStore.attendanceDate
            
            
        }else if indexPath.row == 1{
            
            cellItem.valueAttenLabel.isHidden = false
            cellItem.valueAttenLabel?.text = ForAttendanceStore.attendanceDay
        }else if indexPath.row == 2{
            
            cellItem.valueAttenLabel.isHidden = false
            cellItem.valueAttenLabel?.text = ForAttendanceStore.checkIn
        }else if indexPath.row == 3{
            
            cellItem.valueAttenLabel.isHidden = false
            cellItem.valueAttenLabel?.text = ForAttendanceStore.checkOut
        }else if indexPath.row == 4{
            
            cellItem.valueAttenLabel.isHidden = false
            cellItem.valueAttenLabel?.text = ForAttendanceStore.timeSpent
        }else if indexPath.row == 5{
            
            cellItem.valueAttenLabel.isHidden = false
            cellItem.valueAttenLabel?.text = ForAttendanceStore.extraHours
        }else if indexPath.row == 6{
            
            cellItem.valueAttenLabel.isHidden = false
            cellItem.valueAttenLabel?.text =  String(ForAttendanceStore.totalPoints)
        }        else if indexPath.row == 7{
            
            cellItem.stautusViewButton.isHidden = false
            cellItem.valueAttenLabel.isHidden = true
            
            }
        
        return cellItem
    }
    

            
}
