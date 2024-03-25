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
    
    func set(startTimestamp: Int,
             matchMinute: String,
             homeTeamLogo: UIImage,
             awayTeamLogo: UIImage,
             homeTeamName: String,
             awayTeamName: String,
             homeTeamScore: String,
             awayTeamScore: String,
             matchStatus: MatchStatus) {
        eventView.homeTeamImage(homeTeamLogo)
        eventView.awayTeamImage(awayTeamLogo)
        eventView.homeTeamLabel(homeTeamName)
        eventView.awayTeamLabel(awayTeamName)
        eventView.homeTeamScore(homeTeamScore)
        eventView.awayTeamScore(awayTeamScore)
        eventView.startTime(EventDateHelper.getStartTime(for: startTimestamp))
        eventView.matchTime(EventDateHelper.getMatchMinute(for: matchMinute))
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
