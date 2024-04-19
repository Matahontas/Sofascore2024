//
//  UserDefaultsHelper.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 14.04.2024..
//

import Foundation

enum UserDefaultsHelper {
    
    static let tabBarIndexKey = "tabBarIndex"
    static var tabBarIndex: Int {
        get { return UserDefaults.standard.integer(forKey: tabBarIndexKey) }
        set { UserDefaults.standard.set(newValue, forKey: tabBarIndexKey) }
    }
}
