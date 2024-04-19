//
//  TabBarSports.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 03.04.2024..
//

import Foundation

enum TabBarSports {
    
    case football
    case basketball
    case american_football
    
    var sportIndex: Int {
        switch self {
        case .football:
            return 0
        case .basketball:
            return 1
        case .american_football:
            return 2
        }
    }
}
