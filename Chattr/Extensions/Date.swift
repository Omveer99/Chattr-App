//
//  Date.swift
//  Chattr
//
//  Created by Omveer Panwar on 28/06/25.
//

import Foundation

extension Date{
    private var timeFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateFormat = "HH:mm"
        return formatter
    }
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.dateFormat = "dd MMM yyyy"
        return formatter
    }
    
    private func timeString() -> String {
        return timeFormatter.string(from: self)
    }
    
    private func dateString() -> String {
        return dateFormatter.string(from: self)
    }
    func timestampString() -> String {
        if Calendar.current.isDateInToday(self){
            return timeString()
        } else if Calendar.current.isDateInYesterday(self){
            return "Yesterday"
        } else {
            return dateString()
        }
    }
}
