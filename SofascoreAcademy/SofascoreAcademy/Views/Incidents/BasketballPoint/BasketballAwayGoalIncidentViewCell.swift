//
//  BasketballAwayGoalIncidentViewCell.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 09.06.2024..
//

import SnapKit
import UIKit

class BasketballAwayGoalIncidentViewCell: UITableViewCell {
    
    private let basketballAwayGoalIncidentView: BasketballAwayGoalIncidentView = .init()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        createViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createViews() {
        addSubview(basketballAwayGoalIncidentView)
        backgroundColor = .sofaWhite
        basketballAwayGoalIncidentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension BasketballAwayGoalIncidentViewCell {
    func set(_ eventIncident: EventIncidentsResponse) {
        basketballAwayGoalIncidentView
            .incidentMinute(eventIncident.time)
            .currentScore("\(eventIncident.homeScore ?? 0) - \(eventIncident.awayScore ?? 0)")
        
        if eventIncident.goalType == "onepoint" {
            basketballAwayGoalIncidentView.iconImage(.icNumOnepoint)
        }
        if eventIncident.goalType == "twopoint" {
            basketballAwayGoalIncidentView.iconImage(.icNumTwopoint)
        }
        if eventIncident.goalType == "threepoint" {
            basketballAwayGoalIncidentView.iconImage(.icNumThreepoint)
        }
    }
}
