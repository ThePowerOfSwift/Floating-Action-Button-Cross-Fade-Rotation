//
//  StringExtensions.swift.swift
//  EMobileView
//
//  Created by Yung Dai on 2016-10-17.
//  Copyright © 2016 Yung Dai. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    enum Day: Int {
        
        case sunday = 1,monday = 2, tuesday = 3, wednesday = 4,
        thursday = 5, friday = 6, saturday = 7
    }
    
    enum Month: Int {
        
        case jan = 1, feb = 2, march = 3, april = 4, may = 5, june = 6,
        july = 7, aug = 8, sept = 9, oct = 10, nov = 11, dec = 12
    }
    
    func convertStringToDollarValue(_ string: String) -> String {
        
        // make sure you the value will have a dollar sign in front of it
        guard Double(string) != nil else { return "$0.00" }
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.roundingMode = .up
        
        let formattedString = String(format: "$%.2f", string)
        
        return formattedString
    }
    
    func getDayOfWeekAsString(_ dayAsInt: Int) -> String {
        
        let weekDay: Day = String.Day(rawValue: dayAsInt)!
        
        var weekdayString = ""
        switch weekDay {
        case .monday:
            weekdayString = "Monday"
            break
        case .tuesday:
            weekdayString = "Tuesday"
            break
        case .wednesday:
            weekdayString = "Wednesday"
            break
        case .thursday:
            weekdayString = "Thursday"
            break
        case .friday:
            weekdayString = "Friday"
            break
        case .saturday:
            weekdayString = "Saturday"
            break
        case .sunday:
            weekdayString = "Sunday"
            break
        }
        
        return weekdayString
    }
    
    func getMonthAsString(_ monthAsInt: Int) -> String {
        
        let month: Month = String.Month(rawValue: monthAsInt)!
        
        var monthString = ""
        
        switch month {
        case .jan:
            monthString = "January"
            break
        case .feb:
            monthString = "February"
            break
        case .march:
            monthString = "March"
            break
        case .april:
            monthString = "April"
            break
        case .may:
            monthString = "May"
            break
        case .june:
            monthString = "June"
            break
        case .july:
            monthString = "July"
            break
        case .aug:
            monthString = "August"
            break
        case .sept:
            monthString = "September"
            break
        case .oct:
            monthString = "October"
            break
        case .nov:
            monthString = "November"
            break
        case .dec:
            monthString = "December"
            break
        }
        
        return monthString
    }
    
    func deviceOrientation() -> String! {
        let device = UIDevice.current
        if device.isGeneratingDeviceOrientationNotifications {
            device.beginGeneratingDeviceOrientationNotifications()
            var deviceOrientation: String = ""
            let deviceOrientationRaw = device.orientation.rawValue
            switch deviceOrientationRaw {
            case 1:
                deviceOrientation = "Portrait"
                break
            case 2:
                
                deviceOrientation = "Upside Down"
                
                break
            case 3:
                deviceOrientation = "Landscape Right"
                
                break
            case 4:
                deviceOrientation = "Landscape Left"
                
                break
            case 5:
                deviceOrientation = "Camera Facing Down"
                
                break
            case 6:
                deviceOrientation = "Camera Facing Up"
                
                break
            default:
                deviceOrientation = "Unknown"
                
                break
            }
            return deviceOrientation
        } else {
            return nil
        }
        
    
    }
    
    func getStringValueFromPlist(plistName: String, valueForKey: String) -> String! {
        
        var plistFormat = PropertyListSerialization.PropertyListFormat.xml
        var plistData: [String: AnyObject] = [:]
        let plistPath: String? = Bundle.main.path(forResource: plistName, ofType: "plist")
        let plistXML = FileManager.default.contents(atPath: plistPath!)!
        
        do {
            plistData = try PropertyListSerialization.propertyList(from: plistXML, options: .mutableContainersAndLeaves, format: &plistFormat) as! [String: AnyObject]
            
        } catch {
            
            print("Error in plist")
        }
        
        let answer = plistData[valueForKey]?.value as String!
        
        return answer!

    }
    

}
