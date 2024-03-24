//
//  EventModel.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 22.03.2024..
//

import Foundation
import UIKit

struct EventModel {
    var startTimestamp: Int
    var matchMinute: String
    var homeTeamLogo: UIImage
    var awayTeamLogo: UIImage
    var homeTeamName: String
    var awayTeamName: String
    var homeTeamScore: String
    var awayTeamScore: String
    var matchStatus: MatchStatus
    var winnerCode: Int {
        if (Double(homeTeamScore) ?? 0 > Double(awayTeamScore) ?? 0) {
            return 1
        } else if (Double(homeTeamScore) ?? 0 < Double(awayTeamScore) ?? 0) {
            return 2
        } else {
            return 3
        }
    }
}

extension EventModel {
    static let sampleData: [EventModel] =
    [
        EventModel(startTimestamp: 1710158400,
                       matchMinute: .full_time,
                       homeTeamLogo: .manUtdLogo,
                       awayTeamLogo: .barcelonaLogo,
                       homeTeamName: .man_utd,
                       awayTeamName: .barcelona,
                       homeTeamScore: "3",
                       awayTeamScore: "4",
                       matchStatus: MatchStatus.finished
                      ),
        EventModel(startTimestamp: 1710169200,
                       matchMinute: "1710170640",
                       homeTeamLogo: .manUtdLogo,
                       awayTeamLogo: .barcelonaLogo,
                       homeTeamName: .man_utd,
                       awayTeamName: .barcelona,
                       homeTeamScore: "2",
                       awayTeamScore: "1",
                       matchStatus: MatchStatus.inProgress
                      ),
        EventModel(startTimestamp: 1710176400,
                       matchMinute: .no_match_minute,
                       homeTeamLogo: .manUtdLogo,
                       awayTeamLogo: .barcelonaLogo,
                       homeTeamName: .man_utd,
                       awayTeamName: .barcelona,
                       homeTeamScore: "",
                       awayTeamScore: "",
                       matchStatus: MatchStatus.notStarted
                      ),
        EventModel(startTimestamp: 1710181800,
                       matchMinute: .no_match_minute,
                       homeTeamLogo: .manUtdLogo,
                       awayTeamLogo: .barcelonaLogo,
                       homeTeamName: .man_utd,
                       awayTeamName: .barcelona,
                       homeTeamScore: "",
                       awayTeamScore: "",
                       matchStatus: MatchStatus.notStarted
                      )
    ]
}
