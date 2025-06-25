//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Andro Adel on 24/06/2025.
//

import SwiftUI

@main
struct ToDoListApp: App {
  
  @StateObject var dateManager: DateManager = DateManager()
  @StateObject var tasklistManager: TasksListManager = TasksListManager()
  
    var body: some Scene {
        WindowGroup {
            ContentView()
            .environmentObject(dateManager)
            .environmentObject(tasklistManager)
        }
    }
}
