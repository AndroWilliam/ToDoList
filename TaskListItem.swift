//
//  TaskListItem.swift
//  ToDoList
//
//  Created by Andro Adel on 25/06/2025.
//

import SwiftUI

struct TaskListItem: View {
  @Binding var task: Task
  
  var body: some View {
    HStack(spacing: 12) {
      
      Button {
        task.isCompleted.toggle()
      } label: {
        Image(systemName: task.isCompleted
              ? "checkmark.circle.fill"
              : "circle")
        .imageScale(.large)
        .foregroundStyle(task.isCompleted ? .green : .secondary)
      }
      
      
      VStack(alignment: .leading, spacing: 4) {
        Text(task.title)
          .font(.body)
          .strikethrough(task.isCompleted, pattern: .solid)
        
        Text(
          task.date,
          format: Date.FormatStyle()
            .weekday(.abbreviated)
            .day(.twoDigits)
            .month(.twoDigits)
        )
        .font(.caption2)
        .foregroundStyle(.secondary)
      }
      
      Spacer()
    }
    .padding(.vertical, 8)
    .padding(.horizontal)
  }
}

#Preview {
  TaskListItem(
    task: .constant(
      Task(
        title: "Buy groceries",
        date: Date(),
        isCompleted: false
      )
    )
  )
}

