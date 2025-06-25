//
//  Task.swift
//  ToDoList
//
//  Created by Andro Adel on 25/06/2025.
//

import SwiftUI

struct Task: Codable, Hashable, Identifiable {
  var id: UUID
  var title: String
  var date: Date
  var isCompleted: Bool
  
  init(id: UUID = .init(), title: String, date: Date, isCompleted: Bool) {
    self.id = id
    self.title = title
    self.date = date
    self.isCompleted = isCompleted
  }
}
