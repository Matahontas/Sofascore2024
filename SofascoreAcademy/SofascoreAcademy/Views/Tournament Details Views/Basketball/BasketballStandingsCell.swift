//
//  BasketballStandingsCell.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 10.06.2024..
//

import SnapKit
import UIKit

class BasketballStandingsCell: UITableViewCell {
    
    private let basketballStandingsCellView: BasketballStandingsCellView = .init()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        createViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createViews() {
        addSubview(basketballStandingsCellView)
        basketballStandingsCellView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension BasketballStandingsCell {
    
    func set(_ sortedStanding: SortedStandingsRows, _ standing: Int) {
        basketballStandingsCellView
            .positionLabel(standing)
            .teamLabel(sortedStanding.team.name)
            .playedLabel(sortedStanding.played)
            .winsLabel(sortedStanding.wins)
            .lossesLabel(sortedStanding.losses)
            .diffLabel(-255) //nema podatka u backendu pa je hardkodirano
            .strLabel(0) // isto kao iznad
            .gbLabel(16.0) // opet
            .pctLabel(sortedStanding.percentage ?? 0)
    }
}
