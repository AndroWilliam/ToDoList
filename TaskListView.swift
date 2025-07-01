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

    private var filteredIndices: [Int] {
        items.indices
            .filter { idx in
                Calendar.current.isDate(
                  items[idx].date,
                  inSameDayAs: date
                )
            }
            .sorted { lhs, rhs in
                (!items[lhs].isCompleted && items[rhs].isCompleted)
            }
    }

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                if filteredIndices.isEmpty {
                    Text("No tasks for this day")
                        .foregroundStyle(.secondary)
                        .padding(.top, 20)
                } else {
                    ForEach(filteredIndices, id: \.self) { idx in
                        TaskListItem(task: $items[idx])
                    }
                }
            }
        }
    }
}

#Preview {
    TaskListView(
        date: .constant(Date()),
        items: .constant([
            Task(title: "Buy groceries"),
            Task(title: "Morning run", isCompleted: true),
            Task(
              title: "Call Alice",
              date: Calendar.current.date(byAdding: .day, value: 0, to: Date())!
            ),
            Task(
              title: "Tomorrow’s task",
              date: Calendar.current.date(byAdding: .day, value: 1, to: Date())!
            )
        ])
    )
}
