//
//  EventDateHelper.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 20.03.2024..
//

import Foundation
import UIKit

enum EventDateHelper {
    
    static func getStartTime(for timestamp: Int) -> String {
        var date: Date = .init()
        let dateFormatter = DateFormatter()
        date = Date(timeIntervalSince1970: TimeInterval(timestamp))
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: date)
    }
    
    static func getMatchMinute(for timestamp: String) -> String {
        guard let timestampDouble = Double(timestamp) else {
            return timestamp
        }
        var date: Date = .init()
        let dateFormatter = DateFormatter()
        date = Date(timeIntervalSince1970: Double(timestampDouble))
        dateFormatter.dateFormat = "mm"
        return dateFormatter.string(from: date) + "'"
    }
    
    static func calculateWinner(home: String, away: String) -> [String: UIColor] {
        let homeDouble = Double(home) ?? 0
        let awayDouble = Double(away) ?? 0
        
        if (homeDouble > awayDouble) {
            return ["home": .sofaBlack, "away": .sofaGray]
        } else if (awayDouble > homeDouble) {
            return ["home": .sofaGray, "away": .sofaBlack]
        } else {
            return ["home": .sofaGray, "away": .sofaGray]
        }
    }
}
