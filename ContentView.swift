//
//  ContentView.swift
//  ToDoList
//
//  Created by Andro Adel on 24/06/2025.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var dateManager: DateManager
    @EnvironmentObject var tasksListManager: TasksListManager

    var body: some View {
        VStack(spacing: 0) {
            DateHeaderView()
            
            ScrollView(.vertical) {
                TaskListView(
                    date: $dateManager.selectedDate,
                    items: $tasksListManager.items
                )
                .padding(.horizontal)
            }
            .scrollIndicators(.hidden)          // iOS 17+ API
            .scrollContentBackground(.hidden)   // hide default background if you like
        }
        .ignoresSafeArea(edges: .bottom)        // optional: extend under tab‐bar/nav‐bar
    }
}

#Preview {
    ContentView()
        .environmentObject(DateManager())
        .environmentObject(TasksListManager())
}

