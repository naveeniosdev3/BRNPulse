//
//  DataStore.swift
//  menuSlider
//
//  Created by Naveen on 1/27/18.
//  Copyright © 2018 Naveen. All rights reserved.
//

import Foundation
class DataStore{
    
    static var allData = [Any]()
    
    class func dStore(data:String) {
        
        DataStore.allData.append(data)
        print("data From DataStore\(DataStore.allData)")
    }
    
}
