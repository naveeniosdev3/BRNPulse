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
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        if ForAttendanceStore.indexRowFromDataBaseVC > 0{
            
            storeMainDict = ForAttendanceStore.fullAttendanceDetails[Int(ForAttendanceStore.indexRowFromDataBaseVC)] as! [String : Any]
            
        }
        
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
        
            //print("From Main Dict>>>>>>>............\(storeMainDict)")
        
        for (key, value) in storeMainDict {
            
            if key == "dailyActivityUpdate" {

                print(value)
//                if value == 1 {
//                    
//                     print("NO Status")
//                    
//                }else{
//                    
//                    print("Yes Status")
//                }
        
            }
        }
        
        let cellItem = collectionViewRow.dequeueReusableCell(withReuseIdentifier: "item", for: indexPath)   as! CustomCollectionViewCell
        cellItem.frame.size.width = self.bounds.size.width
        cellItem.frame.size.height = 60.00
        cellItem.menuItemsLabel?.text = menuText[indexPath.row]
        
        if indexPath.row == 7{
        
            cellItem.stautusViewButton.isHidden = false
            cellItem.valueAttenLabel.isHidden = true
        }else{
            cellItem.valueAttenLabel.isHidden = false
            cellItem.valueAttenLabel?.text = "MCA"
        }
        return cellItem
    }
    
}
