//
//  EventCellController.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 17.03.2024..
//

import Foundation


class EventCellController {
    
    var date: Date = .init()
    let dateFormatter = DateFormatter()

    
    func convertMatchStartTimestamp(timestamp: Double) -> String {
        date = Date(timeIntervalSince1970: timestamp)
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: date)
    }
    
    func convertMatchMinuteTimestamp(timestamp: String) -> String {
        guard let timestampDouble = Double(timestamp) else {
            return timestamp
        }
        date = Date(timeIntervalSince1970: Double(timestampDouble))
        dateFormatter.dateFormat = "mm"
        return dateFormatter.string(from: date) + "'"
    }
    
    func calculateWinner(home: String, away: String) -> [String: Double] {
        let homeDouble = Double(home) ?? 0
        let awayDouble = Double(away) ?? 0
        var returnDict: [String: Double] = ["home": 1, "away": 1]
        
        if (homeDouble > awayDouble) {
            returnDict["home"] = 1
            returnDict["away"] = 0.4
            return returnDict
        } else if (awayDouble > homeDouble) {
            returnDict["home"] = 0.4
            returnDict["away"] = 1
            return returnDict
        } else {
            returnDict["home"] = 1
            returnDict["away"] = 1
            return returnDict
        }
    }
}
