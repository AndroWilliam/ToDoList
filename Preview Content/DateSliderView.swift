//
//  DateSliderView.swift
//  ToDoList
//
//  Created by Andro Adel on 24/06/2025.
//

import SwiftUI

struct DateSliderView<Content: View>: View {
    @EnvironmentObject private var dateManager: DateManager
    @State private var activeTab = 1
    @State private var direction: SliderTimeDirection = .unknown

    let content: (WeekModel) -> Content

    init(@ViewBuilder _ content: @escaping (WeekModel) -> Content) {
        self.content = content
    }

    var body: some View {
        TabView(selection: $activeTab) {
            // previous week
            content(dateManager.weeks[0])
                .frame(maxWidth: .infinity)
                .tag(0)

            // current week
            content(dateManager.weeks[1])
                .frame(maxWidth: .infinity)
                .tag(1)
                .onDisappear {
                    guard direction != .unknown else { return }
                    dateManager.update(to: direction)
                    direction = .unknown
                    activeTab = 1
                }

            // next week
            content(dateManager.weeks[2])
                .frame(maxWidth: .infinity)
                .tag(2)
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
                .onChange(of: activeTab) {
                    switch activeTab {
                    case 0: direction = .past
                    case 2: direction = .future
                    default: direction = .unknown
                    }
                }
            }
        }


#Preview {
    DateSliderView { week in
        DateView(week: week)
    }
    .environmentObject(DateManager())
}
