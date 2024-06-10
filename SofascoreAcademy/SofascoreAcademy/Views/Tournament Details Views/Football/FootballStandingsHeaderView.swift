//
//  TournamentStandingsHeaderView.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 10.06.2024..
//

import Foundation
import SnapKit
import SofaAcademic
import UIKit

class FootballStandingsHeaderView: BaseView {
    private let positionMarkerView: UILabel = .init()
    private let teamLabelView: UILabel = .init()
    private let standingsStackView: UIStackView = .init()
    
    private let playedLabelView: UILabel = .init()
    private let winsLabelView: UILabel = .init()
    private let drawLabelView: UILabel = .init()
    private let lossesLabelView: UILabel = .init()
    private let goalsLabelView: UILabel = .init()
    private let pointsLabelView: UILabel = .init()

    override func addViews() {
        addSubview(positionMarkerView)
        addSubview(teamLabelView)
        addSubview(standingsStackView)
        standingsStackView.addArrangedSubview(playedLabelView)
        standingsStackView.addArrangedSubview(winsLabelView)
        standingsStackView.addArrangedSubview(drawLabelView)
        standingsStackView.addArrangedSubview(lossesLabelView)
        standingsStackView.addArrangedSubview(goalsLabelView)
        standingsStackView.addArrangedSubview(pointsLabelView)
    }
    
    override func styleViews() {
        backgroundColor = .safeArea
        
        positionMarkerView.font = .tabular
        positionMarkerView.textColor = .sofaGray
        positionMarkerView.numberOfLines = 1
        positionMarkerView.text = "#"
        
        teamLabelView.font = .tabular
        teamLabelView.textColor = .sofaGray
        teamLabelView.numberOfLines = 1
        teamLabelView.text = "Team"
        
        playedLabelView.font = .tabular
        playedLabelView.textColor = .sofaGray
        playedLabelView.numberOfLines = 1
        playedLabelView.textAlignment = .center
        playedLabelView.text = "P"
        
        winsLabelView.font = .tabular
        winsLabelView.textColor = .sofaGray
        winsLabelView.numberOfLines = 1
        winsLabelView.textAlignment = .center
        winsLabelView.text = "W"
        
        drawLabelView.font = .tabular
        drawLabelView.textColor = .sofaGray
        drawLabelView.numberOfLines = 1
        drawLabelView.textAlignment = .center
        drawLabelView.text = "D"

        lossesLabelView.font = .tabular
        lossesLabelView.textColor = .sofaGray
        lossesLabelView.numberOfLines = 1
        lossesLabelView.textAlignment = .center
        lossesLabelView.text = "L"

        goalsLabelView.font = .tabular
        goalsLabelView.textColor = .sofaGray
        goalsLabelView.numberOfLines = 1
        goalsLabelView.textAlignment = .center
        goalsLabelView.text = "Goals"

        pointsLabelView.font = .tabular
        pointsLabelView.textColor = .sofaGray
        pointsLabelView.numberOfLines = 1
        pointsLabelView.textAlignment = .center
        pointsLabelView.text = "PTS"

        standingsStackView.axis = .horizontal
        standingsStackView.distribution = .fillEqually
    }
    
    override func setupConstraints() {
        positionMarkerView.snp.makeConstraints {
            $0.top.leading.bottom.equalToSuperview().inset(16)
        }
        teamLabelView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(16)
            $0.leading.equalTo(positionMarkerView.snp.trailing).offset(16)
        }
        standingsStackView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(UIScreen.main.bounds.width/2 + 22)
        }
    }
    
    override func setupBinding() {
    }
}
