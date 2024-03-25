//
//  EventStatusHelper.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 25.03.2024..
//

import Foundation

struct EventStatusHelper {
    
    static func matchStatusStyling(for eventCell: EventTableCell, event: EventModel) {
        switch event.matchStatus{
        case .notStarted:
            eventCell.homeTeamLabelColor(.sofaBlack)
            eventCell.awayTeamLabelColor(.sofaBlack)
            eventCell.matchTimeLabelColor(.sofaGray)
        case .inProgress:
            eventCell.homeTeamLabelColor(.sofaBlack)
            eventCell.homeScoreLabelColor(.sofaRed)
            eventCell.awayTeamLabelColor(.sofaBlack)
            eventCell.awayScoreLabelColor(.sofaRed)
            eventCell.matchTimeLabelColor(.sofaRed)
        case .finished:
            eventCell.homeTeamLabelColor(event.winnerCode == 1 ? .sofaBlack : .sofaGray)
            eventCell.homeScoreLabelColor(event.winnerCode == 1 ? .sofaBlack : .sofaGray)
            eventCell.awayTeamLabelColor(event.winnerCode == 2 ? .sofaBlack : .sofaGray)
            eventCell.awayScoreLabelColor(event.winnerCode == 2 ? .sofaBlack : .sofaGray)
            eventCell.matchTimeLabelColor(.sofaGray)
        }
    }
}
