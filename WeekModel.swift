//
//  WeekModel.swift
//  ToDoList
//
//  Created by Andro Adel on 24/06/2025.
//

import Foundation

struct WeekModel: Identifiable, Hashable {
    
    let index: Int
    let dates: [Date]
    var referenceDate: Date
    var id: Int { index }
}
