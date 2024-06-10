//
//  FootballStandingsCell.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 10.06.2024..
//

import SnapKit
import UIKit

class FootballStandingsCell: UITableViewCell {
    
    private let footballStandingsCellView: FootballStandingsCellView = .init()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        createViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createViews() {
        addSubview(footballStandingsCellView)
        footballStandingsCellView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension FootballStandingsCell {
    
    func set(_ sortedStanding: SortedStandingsRows, _ standing: Int) {
        footballStandingsCellView
            .positionLabel(standing)
            .teamLabel(sortedStanding.team.name)
            .playedLabel(sortedStanding.played)
            .winsLabel(sortedStanding.wins)
            .drawLabel(sortedStanding.draws)
            .lossesLabel(sortedStanding.losses)
            .goalsLabel(scored: sortedStanding.scoresFor, conceded: sortedStanding.scoresAgainst)
            .ptsLabel(sortedStanding.points ?? 0)
    }
}
