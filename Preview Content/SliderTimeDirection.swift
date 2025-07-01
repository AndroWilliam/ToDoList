//
//  SliderTimeDirection.swift
//  ToDoList
//
//  Created by Andro Adel on 25/06/2025.
//

import Foundation

enum SliderTimeDirection: Equatable, Hashable {
    case unknown
    case past
    case future

    var dayOffset: Int {
        switch self {
        case .past:    return -7
        case .future:  return +7
        case .unknown: return  0
        }
    }
}
