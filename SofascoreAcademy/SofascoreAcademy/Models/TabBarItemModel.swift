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
}

extension TabBarItemModel {
    
    static let sampleData: [TabBarItemModel] = [
        TabBarItemModel(tabItemIcon: .iconFootball, tabItemName: .football_string, sportTag: .football),
        TabBarItemModel(tabItemIcon: .iconBasketball, tabItemName: .basketball_string, sportTag: .basketball),
        TabBarItemModel(tabItemIcon: .iconAmericanFootball, tabItemName: .american_football_abb, sportTag: .american_football)
    ]
}
