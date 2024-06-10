//
//  AwayGoalIncidentViewCell.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 09.06.2024..
//

import SnapKit
import UIKit

class AwayGoalIncidentViewCell: UITableViewCell {
    
    private let awayGoalIncidentView: AwayGoalIncidentView = .init()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        createViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createViews() {
        addSubview(awayGoalIncidentView)
        backgroundColor = .sofaWhite
        awayGoalIncidentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension AwayGoalIncidentViewCell {
    func set(_ eventIncident: EventIncidentsResponse) {
        awayGoalIncidentView
            .iconImage(.icFootballGreen)
            .incidentMinute(eventIncident.time)
            .playerName(eventIncident.player?.name ?? "")
            .currentScore("\(eventIncident.homeScore ?? 0) - \(eventIncident.awayScore ?? 0)")
    }
}
