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
    private static let tournamentDetailsTabIndexKey = "tournamentDetailsTabIndex"
    private static let tournamentTappedIdKey = "tournamentTappedId"

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
    static var tournamentDetailsTabIndex: Int {
        get { return UserDefaults.standard.integer(forKey: tournamentDetailsTabIndexKey) }
        set { UserDefaults.standard.set(newValue, forKey: tournamentDetailsTabIndexKey) }
    }
    static var tournamentTappedId: Int {
        get { return UserDefaults.standard.integer(forKey: tournamentTappedIdKey) }
        set { UserDefaults.standard.set(newValue, forKey: tournamentTappedIdKey) }
    }
}
