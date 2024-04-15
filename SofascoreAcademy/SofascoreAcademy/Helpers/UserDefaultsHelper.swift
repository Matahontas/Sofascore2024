//
//  UserDefaultsHelper.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 14.04.2024..
//

import Foundation

enum UserDefaultsHelper {
    
    static subscript(key: String) -> Int {
        get {
            return UserDefaults.standard.integer(forKey: key)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}
