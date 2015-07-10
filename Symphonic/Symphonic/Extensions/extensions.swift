//
// Created by Makar Stetsenko on 09.07.15.
// Copyright (c) 2015 Avocado Hills. All rights reserved.
//

import Foundation


public func ==(lhs: NSDate, rhs: NSDate) -> Bool {
    let flags: NSCalendarUnit = .DayCalendarUnit | .MonthCalendarUnit | .YearCalendarUnit
    let lc = NSCalendar.currentCalendar().components(flags, fromDate: lhs)
    let rc = NSCalendar.currentCalendar().components(flags, fromDate: rhs)

    return lc.year == rc.year && lc.month == rc.month && lc.day == rc.day
}

public func <(lhs: NSDate, rhs: NSDate) -> Bool {
    let flags: NSCalendarUnit = .DayCalendarUnit | .MonthCalendarUnit | .YearCalendarUnit
    let lc = NSCalendar.currentCalendar().components(flags, fromDate: lhs)
    let rc = NSCalendar.currentCalendar().components(flags, fromDate: rhs)

    return lc.year < rc.year && lc.month < rc.month && lc.day < rc.day
}

extension NSDate: Comparable {
    convenience init(dateFromString: String) {
        let dateStringFormatter = NSDateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        dateStringFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        let d = dateStringFormatter.dateFromString(dateFromString)!
        self.init(timeInterval:0, sinceDate:d)
    }
}