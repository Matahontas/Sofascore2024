//
//  BasketballHomeGoalIncidentViewCell.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 09.06.2024..
//

import SnapKit
import UIKit

class BasketballHomeGoalIncidentViewCell: UITableViewCell {
    
    private let basketballHomeGoalIncidentView: BasketballHomeGoalIncidentView = .init()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        createViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createViews() {
        addSubview(basketballHomeGoalIncidentView)
        backgroundColor = .sofaWhite
        basketballHomeGoalIncidentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension BasketballHomeGoalIncidentViewCell {
    func set(_ eventIncident: EventIncidentsResponse) {
        basketballHomeGoalIncidentView
            .incidentMinute(eventIncident.time)
            .currentScore("\(eventIncident.homeScore ?? 0) - \(eventIncident.awayScore ?? 0)")
        
        if eventIncident.goalType == "onepoint" {
            basketballHomeGoalIncidentView.iconImage(.icNumOnepoint)
        }
        if eventIncident.goalType == "twopoint" {
            basketballHomeGoalIncidentView.iconImage(.icNumTwopoint)
        }
        if eventIncident.goalType == "threepoint" {
            basketballHomeGoalIncidentView.iconImage(.icNumThreepoint)
        }
    }
}
