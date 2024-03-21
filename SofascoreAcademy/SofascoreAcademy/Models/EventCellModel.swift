//
//  EventCellModel.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 17.03.2024..
//

import Foundation
import UIKit

struct EventCellModel {
    var startTimestamp: Int
    var matchMinute: String
    var homeTeamLogo: UIImage
    var awayTeamLogo: UIImage
    var homeTeamName: String
    var awayTeamName: String
    var homeTeamScore: String
    var awayTeamScore: String
    var matchStatus: MatchStatus
}

extension EventCellModel {
    static let sampleData: [EventCellModel] =
    [
        EventCellModel(startTimestamp: 1710158400,
                       matchMinute: .full_time,
                       homeTeamLogo: .manUtdLogo,
                       awayTeamLogo: .barcelonaLogo,
                       homeTeamName: .man_utd,
                       awayTeamName: .barcelona,
                       homeTeamScore: "3",
                       awayTeamScore: "4",
                       matchStatus: MatchStatus.finished
                      ),
        EventCellModel(startTimestamp: 1710169200,
                       matchMinute: "1710170640.0",
                       homeTeamLogo: .manUtdLogo,
                       awayTeamLogo: .barcelonaLogo,
                       homeTeamName: .man_utd,
                       awayTeamName: .barcelona,
                       homeTeamScore: "2",
                       awayTeamScore: "1",
                       matchStatus: MatchStatus.inProgress
                      ),
        EventCellModel(startTimestamp: 1710176400,
                       matchMinute: .no_match_minute,
                       homeTeamLogo: .manUtdLogo,
                       awayTeamLogo: .barcelonaLogo,
                       homeTeamName: .man_utd,
                       awayTeamName: .barcelona,
                       homeTeamScore: "",
                       awayTeamScore: "",
                       matchStatus: MatchStatus.notStarted
                      ),
        EventCellModel(startTimestamp: 1710181800,
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
