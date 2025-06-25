//
//  TaskListView.swift
//  ToDoList
//
//  Created by Andro Adel on 25/06/2025.
//

import SwiftUI

struct TaskListView: View {
  
  @Binding var date: Date
  @Binding var items: [Task]
  var currentDateTasks: [Task] = []
  
  init(date: Binding<Date>, items: Binding<[Task]>) {
    self._date = date
    self._items = items
    currentDateTasks = getCurrentDateTasks()
  }
  
  
  var body: some View {
    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
  }
  
  func getCurrentDateTasks() -> [Task] {
    return items.filter{ $0.date.toString(format: "EEEE, dd.MM.yyyy") == date.toString(format: "EEE, dd.MM.yyyy") }.sorted { !$0.isCompleted && $1.isCompleted}
  }
}

#Preview {
  ContentView()
    .environmentObject(DateManager())
    .environmentObject(TasksListManager())
  
}
