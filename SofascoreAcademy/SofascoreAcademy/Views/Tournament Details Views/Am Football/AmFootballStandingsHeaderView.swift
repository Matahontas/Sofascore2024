//
//  AmFootballStandingsHeaderView.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 10.06.2024..
//

import Foundation
import SnapKit
import SofaAcademic
import UIKit

class AmFootballStandingsHeaderView: BaseView {
    private let positionMarkerView: UILabel = .init()
    private let teamLabelView: UILabel = .init()
    private let standingsStackView: UIStackView = .init()
    
    private let playedLabelView: UILabel = .init()
    private let winsLabelView: UILabel = .init()
    private let drawLabelView: UILabel = .init()
    private let lossesLabelView: UILabel = .init()
    private let pctLabelView: UILabel = .init()

    override func addViews() {
        addSubview(positionMarkerView)
        addSubview(teamLabelView)
        addSubview(standingsStackView)
        standingsStackView.addArrangedSubview(playedLabelView)
        standingsStackView.addArrangedSubview(winsLabelView)
        standingsStackView.addArrangedSubview(drawLabelView)
        standingsStackView.addArrangedSubview(lossesLabelView)
        standingsStackView.addArrangedSubview(pctLabelView)
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

        lossesLabelView.font = .tabular
        lossesLabelView.textColor = .sofaGray
        lossesLabelView.numberOfLines = 1
        lossesLabelView.textAlignment = .center
        lossesLabelView.text = "L"

        drawLabelView.font = .tabular
        drawLabelView.textColor = .sofaGray
        drawLabelView.numberOfLines = 1
        drawLabelView.textAlignment = .center
        drawLabelView.text = "D"
        
        pctLabelView.font = .tabular
        pctLabelView.textColor = .sofaGray
        pctLabelView.numberOfLines = 1
        pctLabelView.textAlignment = .center
        pctLabelView.text = "PCT"

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
            $0.width.equalTo(UIScreen.main.bounds.width/2 - 8)
        }
    }
    
    override func setupBinding() {
    }
}
