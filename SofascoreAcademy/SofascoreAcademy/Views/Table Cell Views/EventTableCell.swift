//
//  EventTableCell.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 21.03.2024..
//

import SnapKit
import UIKit

class EventTableCell: UITableViewCell {
    
    private let eventView: EventView = .init()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        createViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createViews() {
        addSubview(eventView)
        eventView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension EventTableCell {
    
    func set(eventResponse: EventResponse) {
        
        eventView.homeTeamImage(UserDefaultsHelper.sofaApiUrlString + "team/" + "\(eventResponse.homeTeam.id)/" + "image", placeHolder: UIImage(systemName: "person.3.fill"))
            .awayTeamImage(UserDefaultsHelper.sofaApiUrlString + "team/" + "\(eventResponse.awayTeam.id)/" + "image", placeHolder: UIImage(systemName: "person.3.fill"))
            .homeTeamLabel(eventResponse.homeTeam.name)
            .awayTeamLabel(eventResponse.awayTeam.name)
            .homeTeamScore(eventResponse.homeScore.total ?? -1)
            .awayTeamScore(eventResponse.awayScore.total ?? -1)
            .startTime(eventResponse.startDate)
        
        if eventResponse.status == "notstarted" {
            eventView.homeTeamLabelColor(.sofaBlack)
                .awayTeamLabelColor(.sofaBlack)
                .matchTimeColor(.sofaGray)
                .matchTime("-")
        }
        if eventResponse.status == "inprogress" {
            eventView.homeTeamLabelColor(.sofaBlack)
                .homeScoreLabelColor(.sofaRed)
                .awayTeamLabelColor(.sofaBlack)
                .awayScoreLabelColor(.sofaRed)
                .matchTimeColor(.sofaRed)
                .matchTime(eventResponse.startDate)
        }
        if eventResponse.status == "finished" {
            eventView.homeTeamLabelColor(eventResponse.winnerCode == "home" ? .sofaBlack : .sofaGray)
                .homeScoreLabelColor(eventResponse.winnerCode == "home" ? .sofaBlack : .sofaGray)
                .awayTeamLabelColor(eventResponse.winnerCode == "away" ? .sofaBlack : .sofaGray)
                .awayScoreLabelColor(eventResponse.winnerCode == "away" ? .sofaBlack : .sofaGray)
                .matchTimeColor(.sofaGray)
                .matchTime("FT")
        }
    }
}
