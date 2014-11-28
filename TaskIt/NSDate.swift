//
//  NSDate.swift
//  TaskIt
//
//  Created by Brandon Zimmerman on 11/28/14.
//  Copyright (c) 2014 Hammer Forged Games. All rights reserved.
//

import Foundation

extension NSDate
{
    class func create(#year: Int, month: Int, day: Int) -> NSDate
    {
        let components = NSDateComponents()
        components.year = year
        components.month = month
        components.day = day
        
        let calendar = NSCalendar(identifier: NSGregorianCalendar)!
        
        return calendar.dateFromComponents(components)!
    }
    
    func toString() -> String
    {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "MMM dd, yyyy"
        
        return formatter.stringFromDate(self)
    }
}