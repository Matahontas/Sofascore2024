//
//  AwayCardIncidentViewCell.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 09.06.2024..
//

import SnapKit
import UIKit

class AwayCardIncidentViewCell: UITableViewCell {
    
    private let awayCardIncidentView: AwayCardIncidentView = .init()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        createViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createViews() {
        addSubview(awayCardIncidentView)
        backgroundColor = .sofaWhite
        awayCardIncidentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension AwayCardIncidentViewCell {
    func set(_ eventIncident: EventIncidentsResponse) {
        awayCardIncidentView
            .incidentMinute(eventIncident.time)
            .playerName(eventIncident.player?.name ?? "")
            .incidentDescription("Foul")
        if eventIncident.color == "yellow" {
            awayCardIncidentView.cardImage(.yellowCard)
        } else {
            awayCardIncidentView.cardImage(.redCard)
        }
    }
}
