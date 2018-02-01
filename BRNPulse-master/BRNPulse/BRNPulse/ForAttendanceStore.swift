//
//  ForAttendanceStore.swift
//  BRNPulse
//
//  Created by Naveen on 1/30/18.
//  Copyright © 2018 Naveen. All rights reserved.
//

import Foundation
class ForAttendanceStore{
    
    static var attendanceSummaryDetailsArr = Array<String>()
    static var attendanceDict:Dictionary = [String:Any]()
    static var valueStoreArr = [Any]()
    static var forStatusDict:Dictionary = [String:String]()
    static var fullAttendanceDetails = [Any]()
    
    static var fullDictByIndex:Dictionary = [String:Any]()
    
    static var indexRowFromDataBaseVC = UInt16()
    
    static var attendanceDate = String()
    static var attendanceDay = String()
    static var checkIn = String()
    static var checkOut = String()
    static var timeSpent = String()
    static var extraHours = String()
    static var totalPoints = UInt8()
}
