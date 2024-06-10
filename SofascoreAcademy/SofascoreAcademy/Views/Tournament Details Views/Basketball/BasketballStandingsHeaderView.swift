//
//  BasketballStandingsHeaderView.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 10.06.2024..
//

import Foundation
import SnapKit
import SofaAcademic
import UIKit

class BasketballStandingsHeaderView: BaseView {
    private let positionMarkerView: UILabel = .init()
    private let teamLabelView: UILabel = .init()
    private let standingsStackView: UIStackView = .init()
    
    private let playedLabelView: UILabel = .init()
    private let winsLabelView: UILabel = .init()
    private let lossesLabelView: UILabel = .init()
    private let diffLabelView: UILabel = .init()
    private let strLabelView: UILabel = .init()
    private let gbLabelView: UILabel = .init()
    private let pctLabelView: UILabel = .init()

    override func addViews() {
        addSubview(positionMarkerView)
        addSubview(teamLabelView)
        addSubview(standingsStackView)
        standingsStackView.addArrangedSubview(playedLabelView)
        standingsStackView.addArrangedSubview(winsLabelView)
        standingsStackView.addArrangedSubview(lossesLabelView)
        standingsStackView.addArrangedSubview(diffLabelView)
        standingsStackView.addArrangedSubview(strLabelView)
        standingsStackView.addArrangedSubview(gbLabelView)
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

        diffLabelView.font = .tabular
        diffLabelView.textColor = .sofaGray
        diffLabelView.numberOfLines = 1
        diffLabelView.textAlignment = .center
        diffLabelView.text = "DIFF"

        strLabelView.font = .tabular
        strLabelView.textColor = .sofaGray
        strLabelView.numberOfLines = 1
        strLabelView.textAlignment = .center
        strLabelView.text = "Str"
        
        gbLabelView.font = .tabular
        gbLabelView.textColor = .sofaGray
        gbLabelView.numberOfLines = 1
        gbLabelView.textAlignment = .center
        gbLabelView.text = "GB"
        
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
            $0.width.equalTo(UIScreen.main.bounds.width/2 + 22)
        }
    }
    
    override func setupBinding() {
    }
}
