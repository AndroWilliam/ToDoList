//
//  ContentView.swift
//  ToDoList
//
//  Created by Andro Adel on 24/06/2025.
//

import SwiftUI

struct ContentView: View {
  
  @EnvironmentObject var weekManager: DateManager
  @EnvironmentObject var tasksListManager: TasksListManager
  
  var body: some View {
    ZStack {
      VStack {
        DateHeaderView()
        ScrollView(.vertical) {
          VStack {
            TaskListView(date: $weekManager.selectedDate, items: $tasksListManager.items)
          }
          
        }
        .scrollIndicators(.hidden)
      }
    }
  }
}

#Preview {
  ContentView()
    .environmentObject(DateManager())
    .environmentObject(TasksListManager())
  
}
