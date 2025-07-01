//
//  DateManager.swift
//  ToDoList
//
//  Created by Andro Adel on 24/06/2025.
//

import Foundation

class DateManager: ObservableObject {
    @Published private(set) var weeks: [WeekModel] = []
    
    @Published var selectedDate: Date {
        didSet {
            calcWeeks(for: selectedDate)
        }
    }

    init(date: Date = Date()) {
        let start = Calendar.current.startOfDay(for: date)
        self.selectedDate = start
        calcWeeks(for: start)
    }

    private func calcWeeks(for date: Date) {
        // Safely compute “one week before” and “one week after”
        let previous = Calendar.current.date(byAdding: .day, value: -7, to: date) ?? date
        let next     = Calendar.current.date(byAdding: .day, value:  +7, to: date) ?? date

        weeks = [
            week(for: previous, index: -1),
            week(for: date,     index:  0),
            week(for: next,     index:  1)
        ]
    }

    private func week(for date: Date, index: Int) -> WeekModel {
        // Find the start of this week
        let comps = Calendar.current.dateComponents([.yearForWeekOfYear, .weekOfYear],
                                                    from: date)
        guard let startOfWeek = Calendar.current.date(from: comps) else {
            return WeekModel(index: index, dates: [], referenceDate: date)
        }

        // Build seven days from Monday through Sunday (or your locale’s firstWeekday)
        let days: [Date] = (0...6).compactMap {
            Calendar.current.date(byAdding: .day, value: $0, to: startOfWeek)
        }

        return WeekModel(index: index, dates: days, referenceDate: date)
    }

    // MARK: – Public API

    func selectToday() {
        selectedDate = Calendar.current.startOfDay(for: Date())
    }

    func select(date: Date) {
        selectedDate = Calendar.current.startOfDay(for: date)
    }

    func update(to direction: SliderTimeDirection) {
        let delta: Int = {
            switch direction {
            case .future:  return +7
            case .past:    return -7
            case .unknown: return  0
            }
        }()

        selectedDate = Calendar.current
            .date(byAdding: .day, value: delta, to: selectedDate) ?? selectedDate
    }
}
