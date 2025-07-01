//
//  Task.swift
//  ToDoList
//
//  Created by Andro Adel on 25/06/2025.
//

import Foundation

struct Task: Identifiable, Codable, Hashable {
  // MARK: – Properties
  let id: UUID
  var title: String
  var date: Date
  var isCompleted: Bool
  
  // MARK: – Init
  init(
    id: UUID = UUID(),
    title: String,
    date: Date = Date(),
    isCompleted: Bool = false
  ) {
    self.id = id
    self.title = title
    self.date = Calendar.current.startOfDay(for: date)
    self.isCompleted = isCompleted
  }
  
  // MARK: – Hashable / Equatable
  func hash(into hasher: inout Hasher) {
    hasher.combine(id)
  }
  
  static func == (lhs: Task, rhs: Task) -> Bool {
    lhs.id == rhs.id
  }
}
