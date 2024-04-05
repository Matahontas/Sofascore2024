//
//  TabBarModel.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 03.04.2024..
//

import Foundation
import UIKit

struct TabBarItemModel {
    
    var tabItemIcon: UIImage
    var tabItemName: String
    var sportTag: TabBarSports
    var sportIndex: Int {
        switch sportTag {
        case .football:
            return 0
        case .basketball:
            return 1
        case .american_football:
            return 2
        }
    }
}

extension TabBarItemModel {
    
    static let sampleData: [TabBarItemModel] = [
        TabBarItemModel(tabItemIcon: .iconFootball, tabItemName: .football_string, sportTag: .football),
        TabBarItemModel(tabItemIcon: .iconBasketball, tabItemName: .basketball_string, sportTag: .basketball),
        TabBarItemModel(tabItemIcon: .iconAmericanFootball, tabItemName: .american_football_abb, sportTag: .american_football)
    ]
}
