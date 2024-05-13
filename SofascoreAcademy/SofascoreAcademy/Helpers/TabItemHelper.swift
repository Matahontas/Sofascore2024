//
//  TabItemHelper.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 11.05.2024..
//

import Foundation

enum TabItemHelper {
    
    static func getSportSlugFromTabIndex(_ tabIndex: Int) -> String{
        switch tabIndex {
        case 0:
            return "football"
        case 1:
            return "basketball"
        case 2:
            return "american-football"
        default:
            return ""
        }
    }
}
