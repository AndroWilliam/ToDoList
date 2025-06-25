//
//  TaskListItem.swift
//  ToDoList
//
//  Created by Andro Adel on 25/06/2025.
//

import SwiftUI

struct TaskListItem: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ContentView()
    .environmentObject(DateManager())
    .environmentObject(TasksListManager())
}
