//
//  AmFootballStandingsCell.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 10.06.2024..
//

import SnapKit
import UIKit

class AmFootballStandingsCell: UITableViewCell {
    
    private let amFootballStandingsCellView: AmFootballStandingsCellView = .init()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        createViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createViews() {
        addSubview(amFootballStandingsCellView)
        amFootballStandingsCellView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension AmFootballStandingsCell {
    
    func set(_ sortedStanding: SortedStandingsRows, _ standing: Int) {
        amFootballStandingsCellView
            .positionLabel(standing)
            .teamLabel(sortedStanding.team.name)
            .playedLabel(sortedStanding.played)
            .winsLabel(sortedStanding.wins)
            .drawLabel(sortedStanding.draws)
            .lossesLabel(sortedStanding.losses)
            .pctLabel(sortedStanding.percentage ?? 0)
    }
}
