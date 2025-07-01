//
//  DateHeaderView.swift
//  ToDoList
//
//  Created by Andro Adel on 24/06/2025.
//

import SwiftUI

struct DateHeaderView: View {
    @EnvironmentObject private var dateManager: DateManager

    var body: some View {
        VStack(spacing: 12) {
            nameHeaderTextView()

            DateSliderView { week in
                DateView(week: week)
            }
            .frame(height: 60)

            Divider()

            HStack {
                Spacer()
                Text(
                    dateManager.selectedDate,
                    format: Date.FormatStyle()
                        .weekday(.abbreviated)
                        .day(.twoDigits)
                        .month(.twoDigits)
                        .year()
                )
                .font(.system(size: 10, design: .rounded))
                .foregroundColor(.gray)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
    }

    @ViewBuilder
    private func nameHeaderTextView() -> some View {
        HStack {
            // Left: greeting + subtitle
            VStack(alignment: .leading, spacing: 4) {
                Text("Hi, Javid")
                    .font(.title2.weight(.semibold))
                    .foregroundColor(.primary)

                Text(
                    dateManager.selectedDate == Calendar.current.startOfDay(for: Date())
                        ? "What's up for today?"
                        : "Planning for future?"
                )
                .font(.caption)
                .foregroundColor(.secondary)
            }

            Spacer()

            // Right: month + Today button
            VStack(alignment: .trailing, spacing: 4) {
                Text(
                    dateManager.selectedDate,
                    format: Date.FormatStyle().month(.wide)
                )
                .font(.system(size: 12, weight: .heavy))
                .foregroundColor(.primary)

                Button("Today") {
                    withAnimation(.linear(duration: 0.1)) {
                        dateManager.selectToday()
                    }
                }
                .buttonStyle(.borderedProminent)
            }
        }
    }
}

#Preview {
    DateHeaderView()
        .environmentObject(DateManager())
}
