//
//  HomeCardIncidentViewCell.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 09.06.2024..
//

import SnapKit
import UIKit

class HomeCardIncidentViewCell: UITableViewCell {
    
    private let homeCardIncidentView: HomeCardIncidentView = .init()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        createViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createViews() {
        addSubview(homeCardIncidentView)
        backgroundColor = .sofaWhite
        homeCardIncidentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension HomeCardIncidentViewCell {
    func set(_ eventIncident: EventIncidentsResponse) {
        homeCardIncidentView
            .incidentMinute(eventIncident.time)
            .playerName(eventIncident.player?.name ?? "")
            .incidentDescription("Foul")
        if eventIncident.color == "yellow" {
            homeCardIncidentView.cardImage(.yellowCard)
        } else {
            homeCardIncidentView.cardImage(.redCard)
        }
    }
}
