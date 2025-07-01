//
//  Date=Extension.swift
//  ToDoList
//
//  Created by Andro Adel on 24/06/2025.
//

import Foundation

extension Date {
    func monthToString() -> String {
        let formatter = DateFormatter()
        formatter.locale = .current
        formatter.dateFormat = "LLLL"
        return formatter.string(from: self)
    }

    func toString(format: String) -> String {
        let formatter = DateFormatter()
        formatter.locale = .current
        formatter.calendar = Calendar.current
        formatter.dateFormat = format
        return formatter.string(from: self)
    }

    var startOfDay: Date {
        Calendar.current.startOfDay(for: self)
    }

    var yesterday: Date {
        Calendar.current.date(byAdding: .day, value: -1, to: self) ?? self
    }

    var tomorrow: Date {
        Calendar.current.date(byAdding: .day, value:  1, to: self) ?? self
    }
}

