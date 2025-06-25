//
//  Date=Extension.swift
//  ToDoList
//
//  Created by Andro Adel on 24/06/2025.
//

import Foundation

extension Date {
  func monthToString() -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "LLLL"
    return dateFormatter.string(from: self)
  }
  
  func toString(format: String) -> String {
    let formatter = DateFormatter()
    formatter.calendar = Calendar.current
    formatter.dateFormat = format
    
    return formatter.string(from: self)
  }
  
  var yesterday: Date {
    Calendar.current.date(byAdding: .day, value: -1, to: self)!
  }
  
  var tomorrow: Date {
    Calendar.current.date(byAdding: .day, value: 1, to: self)!
  }
}
