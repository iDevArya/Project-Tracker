//
//  DateFormatter.swift
//  Project Tracker
//
//  Created by Shiva kumar Arya on 5/4/24.
//

import Foundation

struct DateHelper {
    static func convertDate(date: Date) -> String {
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        return df.string(from: date)
    }
}
