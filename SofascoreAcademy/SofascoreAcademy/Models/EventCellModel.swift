//
//  EventCellModel.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 17.03.2024..
//

import Foundation
import UIKit


struct EventCellModel: Identifiable {
    let id: UUID
    var matchStartTime: Double
    var matchMinute: String
    var homeTeamLogo: UIImage
    var awayTeamLogo: UIImage
    var homeTeamLabel: String
    var awayTeamLabel: String
    var homeTeamScore: String
    var awayTeamScore: String
    var matchStatus: MatchStatus
    
    init(id: UUID = UUID(), matchStartTime: Double, matchMinute: String, homeTeamLogo: UIImage, awayTeamLogo: UIImage, homeTeamLabel: String, awayTeamLabel: String, homeTeamScore: String, awayTeamScore: String, matchStatus: MatchStatus) {
        self.id = id
        self.matchStartTime = matchStartTime
        self.matchMinute = matchMinute
        self.homeTeamLogo = homeTeamLogo
        self.awayTeamLogo = awayTeamLogo
        self.homeTeamLabel = homeTeamLabel
        self.awayTeamLabel = awayTeamLabel
        self.homeTeamScore = homeTeamScore
        self.awayTeamScore = awayTeamScore
        self.matchStatus = matchStatus
    }
}


extension EventCellModel {
    static let sampleData: [EventCellModel] =
    [
        EventCellModel(matchStartTime: 1710158400.0,
                       matchMinute: AppStrings.full_time,
                       homeTeamLogo: UIImage(named: "man_utd_logo") ?? UIImage(),
                       awayTeamLogo: UIImage(named: "barcelona_logo") ?? UIImage(),
                       homeTeamLabel: AppStrings.man_utd,
                       awayTeamLabel: AppStrings.barcelona,
                       homeTeamScore: "3",
                       awayTeamScore: "4",
                       matchStatus: MatchStatus.finished
                      ),
        EventCellModel(matchStartTime: 1710169200.0,
                       matchMinute: "1710170640.0",
                       homeTeamLogo: UIImage(named: "man_utd_logo") ?? UIImage(),
                       awayTeamLogo: UIImage(named: "barcelona_logo") ?? UIImage(),
                       homeTeamLabel: AppStrings.man_utd,
                       awayTeamLabel: AppStrings.barcelona,
                       homeTeamScore: "2",
                       awayTeamScore: "1",
                       matchStatus: MatchStatus.inProgress
                      ),
        EventCellModel(matchStartTime: 1710176400.0,
                       matchMinute: AppStrings.no_match_minute,
                       homeTeamLogo: UIImage(named: "man_utd_logo") ?? UIImage(),
                       awayTeamLogo: UIImage(named: "barcelona_logo") ?? UIImage(),
                       homeTeamLabel: AppStrings.man_utd,
                       awayTeamLabel: AppStrings.barcelona,
                       homeTeamScore: "",
                       awayTeamScore: "",
                       matchStatus: MatchStatus.notStarted
                      ),
        EventCellModel(matchStartTime: 1710181800.0,
                       matchMinute: AppStrings.no_match_minute,
                       homeTeamLogo: UIImage(named: "man_utd_logo") ?? UIImage(),
                       awayTeamLogo: UIImage(named: "barcelona_logo") ?? UIImage(),
                       homeTeamLabel: AppStrings.man_utd,
                       awayTeamLabel: AppStrings.barcelona,
                       homeTeamScore: "",
                       awayTeamScore: "",
                       matchStatus: MatchStatus.notStarted
                      )
    ]
}
