//
//  UserDefaultsHelper.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 14.04.2024..
//

import Foundation

enum UserDefaultsHelper {
    
    private static let tabBarIndexKey = "tabBarIndex"
    private static let selectedDateIndexKey = "selectedDateIndex"
    private static let sofaApiUrlStringKey = "sofaApiUrlString"
    private static let selectedDateApiSlugKey = "selectedDateApiSlug"
    private static let selectedSportApiSlugKey = "selectedSportApiSlug"


    static var tabBarIndex: Int {
        get { return UserDefaults.standard.integer(forKey: tabBarIndexKey) }
        set { UserDefaults.standard.set(newValue, forKey: tabBarIndexKey) }
    }
    static var selectedDateIndex: Int {
        get { return UserDefaults.standard.integer(forKey: selectedDateIndexKey) }
        set { UserDefaults.standard.set(newValue, forKey: selectedDateIndexKey) }
    }
    static var sofaApiUrlString: String {
        get { return UserDefaults.standard.string(forKey: sofaApiUrlStringKey) ?? "" }
        set { UserDefaults.standard.set(newValue, forKey: sofaApiUrlStringKey) }
    }
    static var selectedDateApiSlug: String {
        get { return UserDefaults.standard.string(forKey: selectedDateApiSlugKey) ?? "" }
        set { UserDefaults.standard.set(newValue, forKey: selectedDateApiSlugKey) }
    }
    static var selectedSportApiSlug: String {
        get { return UserDefaults.standard.string(forKey: selectedSportApiSlugKey) ?? "" }
        set { UserDefaults.standard.set(newValue, forKey: selectedSportApiSlugKey) }
    }
}
