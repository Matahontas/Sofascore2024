//
//  CalendarViewHelper.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 08.05.2024..
//

import Foundation

enum CalendarViewHelper {
    
    static func calculateIndexForDateIndicatorOffset(_ index: Int) -> Int {
        switch index {
        case 0:
            return 0
        case 1:
            return 1
        case 2:
            return 2
        case 12:
            return 4
        case 13:
            return 5
        case 14:
            return 6
        default:
            return 3
        }
    }
}
