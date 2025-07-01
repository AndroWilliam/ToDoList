//
//  TasksListManager.swift
//  ToDoList
//
//  Created by Andro Adel on 25/06/2025.
//

import Foundation

class TasksListManager: ObservableObject {
  @Published var items: [Task] = [] {
    didSet { saveTasks() }
  }
  
  private let userDefaultsKey = "tasks"
  
  init() {
    loadTasks()
  }
  
  func add(_ task: Task) {
    items.append(task)
  }
  
  func remove(_ task: Task) {
    guard let idx = items.firstIndex(of: task) else { return }
    items.remove(at: idx)
  }
  
  func toggleCompletion(of task: Task) {
    guard let idx = items.firstIndex(of: task) else { return }
    items[idx].isCompleted.toggle()
  }
  
  private func saveTasks() {
    do {
      let data = try JSONEncoder().encode(items)
      UserDefaults.standard.set(data, forKey: userDefaultsKey)
    } catch {
      print("Failed to encode tasks:", error)
    }
  }
  
  private func loadTasks() {
    guard
      let data = UserDefaults.standard.data(forKey: userDefaultsKey),
      let decoded = try? JSONDecoder().decode([Task].self, from: data)
    else {
      items = []
      return
    }
    items = decoded
  }
}
