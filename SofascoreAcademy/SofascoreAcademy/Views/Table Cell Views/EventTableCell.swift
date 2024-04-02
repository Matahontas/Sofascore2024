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
    
    func set(eventModel: EventModel) {
        eventView.homeTeamImage(eventModel.homeTeamLogo)
        eventView.awayTeamImage(eventModel.awayTeamLogo)
        eventView.homeTeamLabel(eventModel.homeTeamName)
        eventView.awayTeamLabel(eventModel.awayTeamName)
        eventView.homeTeamScore(eventModel.homeTeamScore)
        eventView.awayTeamScore(eventModel.awayTeamScore)
        eventView.startTime(EventDateHelper.getStartTime(for: eventModel.startTimestamp))
        eventView.matchTime(EventDateHelper.getMatchMinute(for: eventModel.matchMinute))
        
        switch eventModel.matchStatus {
        case .notStarted:
            eventView.homeTeamLabelColor(.sofaBlack)
                .awayTeamLabelColor(.sofaBlack)
                .matchTimeColor(.sofaGray)
        case .inProgress:
            eventView.homeTeamLabelColor(.sofaBlack)
                .homeScoreLabelColor(.sofaRed)
                .awayTeamLabelColor(.sofaBlack)
                .awayScoreLabelColor(.sofaRed)
                .matchTimeColor(.sofaRed)
        case .finished:
            eventView.homeTeamLabelColor(eventModel.winnerCode == 1 ? .sofaBlack : .sofaGray)
                .homeScoreLabelColor(eventModel.winnerCode == 1 ? .sofaBlack : .sofaGray)
                .awayTeamLabelColor(eventModel.winnerCode == 2 ? .sofaBlack : .sofaGray)
                .awayScoreLabelColor(eventModel.winnerCode == 2 ? .sofaBlack : .sofaGray)
                .matchTimeColor(.sofaGray)
        }
    }
    
    @discardableResult
    func homeTeamLabelColor(_ color: UIColor) -> Self {
        eventView.homeTeamLabelColor(color)
        return self
    }
    
    @discardableResult
    func awayTeamLabelColor(_ color: UIColor) -> Self {
        eventView.awayTeamLabelColor(color)
        return self
    }
    
    @discardableResult
    func homeScoreLabelColor(_ color: UIColor) -> Self {
        eventView.homeScoreLabelColor(color)
        return self
    }
    
    @discardableResult
    func awayScoreLabelColor(_ color: UIColor) -> Self {
        eventView.awayScoreLabelColor(color)
        return self
    }
    
    @discardableResult
    func matchTimeLabelColor(_ color: UIColor) -> Self {
        eventView.matchTimeColor(color)
        return self
    }
}
