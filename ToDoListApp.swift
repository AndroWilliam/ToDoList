//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Andro Adel on 24/06/2025.
//

import SwiftUI

@main
struct ToDoListApp: App {
    @StateObject private var dateManager       = DateManager()
    @StateObject private var tasksListManager = TasksListManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(dateManager)
                .environmentObject(tasksListManager)
        }
    }
}

