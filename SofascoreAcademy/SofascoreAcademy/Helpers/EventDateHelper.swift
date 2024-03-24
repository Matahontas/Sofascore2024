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
        let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: date)
    }
    
    static func getMatchMinute(for timestamp: String) -> String {
        guard let timestampInt = Int(timestamp) else {
            return timestamp
        }
        let date = Date(timeIntervalSince1970: TimeInterval(timestampInt))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "mm"
        return dateFormatter.string(from: date) + "'"
    }
}
