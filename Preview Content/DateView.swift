//
//  DateView.swift
//  ToDoList
//
//  Created by Andro Adel on 24/06/2025.
//

import SwiftUI

struct DateView: View {
  @EnvironmentObject private var dateManager: DateManager
  let week: WeekModel
  
  var body: some View {
    HStack(spacing: 8) {
      ForEach(week.dates, id: \.self) { date in
        let isSelected = Calendar.current.isDate(date, inSameDayAs: week.referenceDate)
        
        VStack(spacing: 4) {
          // Day-of-week
          Text(date, format: .dateTime.weekday(.abbreviated))
            .font(.caption2)
            .fontWeight(isSelected ? .semibold : .light)
            .foregroundStyle(isSelected ? .white : .primary)
            .frame(maxWidth: .infinity)
          
          // Day-of-month
          Text(date, format: .dateTime.day())
            .font(.title3)
            .fontWeight(isSelected ? .bold : .light)
            .foregroundStyle(isSelected ? .white : .primary)
            .frame(maxWidth: .infinity)
        }
        .padding(8)
        .background(isSelected ? Color.accentColor : Color.clear)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .onTapGesture {
          withAnimation(.easeInOut(duration: 0.2)) {
            dateManager.select(date: date)
          }
        }
      }
    }
  }
}

#Preview {
  Group {
    // Normal week
    DateView(
      week: .init(
        index: 0,
        dates: [
          Date().yesterday.yesterday,
          Date().yesterday,
          Date(),
          Date().tomorrow,
          Date().tomorrow.tomorrow,
          Date().tomorrow.tomorrow.tomorrow,
          Date().tomorrow.tomorrow.tomorrow.tomorrow
        ],
        referenceDate: Date()
      )
    )
    .environmentObject(DateManager())
    
    // Empty week (won’t crash)
    DateView(
      week: .init(index: 0, dates: [], referenceDate: Date())
    )
    .environmentObject(DateManager())
  }
}
