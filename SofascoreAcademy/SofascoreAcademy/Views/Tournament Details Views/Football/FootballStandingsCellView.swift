//
//  FootballStandingsCellView.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 10.06.2024..
//

import Foundation
import SnapKit
import SofaAcademic
import UIKit

class FootballStandingsCellView: BaseView {
    private let positionMarkerBackgroundView: BaseView = .init()
    private let positionMarkerLabelView: UILabel = .init()
    
    private let teamLabelView: UILabel = .init()
    private let standingsStackView: UIStackView = .init()
    
    private let playedLabelView: UILabel = .init()
    private let winsLabelView: UILabel = .init()
    private let drawLabelView: UILabel = .init()
    private let lossesLabelView: UILabel = .init()
    private let goalsLabelView: UILabel = .init()
    private let ptsLabelView: UILabel = .init()

    override func addViews() {
        addSubview(positionMarkerBackgroundView)
        positionMarkerBackgroundView.addSubview(positionMarkerLabelView)
        addSubview(teamLabelView)
        addSubview(standingsStackView)
        standingsStackView.addArrangedSubview(playedLabelView)
        standingsStackView.addArrangedSubview(winsLabelView)
        standingsStackView.addArrangedSubview(drawLabelView)
        standingsStackView.addArrangedSubview(lossesLabelView)
        standingsStackView.addArrangedSubview(goalsLabelView)
        standingsStackView.addArrangedSubview(ptsLabelView)
    }
    
    override func styleViews() {
        backgroundColor = .safeArea
        
        positionMarkerLabelView.font = .tabular
        positionMarkerLabelView.textColor = .sofaBlack
        positionMarkerLabelView.numberOfLines = 1
        
        teamLabelView.font = .tabular
        teamLabelView.textColor = .sofaBlack
        teamLabelView.numberOfLines = 1
        
        playedLabelView.font = .tabular
        playedLabelView.textColor = .sofaBlack
        playedLabelView.numberOfLines = 1
        playedLabelView.textAlignment = .center
        
        winsLabelView.font = .tabular
        winsLabelView.textColor = .sofaBlack
        winsLabelView.numberOfLines = 1
        winsLabelView.textAlignment = .center

        lossesLabelView.font = .tabular
        lossesLabelView.textColor = .sofaBlack
        lossesLabelView.numberOfLines = 1
        lossesLabelView.textAlignment = .center
        
        drawLabelView.font = .tabular
        drawLabelView.textColor = .sofaBlack
        drawLabelView.numberOfLines = 1
        drawLabelView.textAlignment = .center

        goalsLabelView.font = .tabular
        goalsLabelView.textColor = .sofaBlack
        goalsLabelView.numberOfLines = 1
        goalsLabelView.textAlignment = .center
        
        ptsLabelView.font = .tabular
        ptsLabelView.textColor = .sofaBlack
        ptsLabelView.numberOfLines = 1
        ptsLabelView.textAlignment = .center
        
        standingsStackView.axis = .horizontal
        standingsStackView.distribution = .fillEqually
    }
    
    override func setupConstraints() {
        positionMarkerBackgroundView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(12)
            $0.leading.equalToSuperview().inset(8)
            $0.size.equalTo(24)
        }
        positionMarkerLabelView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        teamLabelView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(16)
            $0.leading.equalTo(positionMarkerBackgroundView.snp.trailing).offset(8)
        }
        standingsStackView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(UIScreen.main.bounds.width/2 + 22)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        positionMarkerBackgroundView.layer.cornerRadius = positionMarkerBackgroundView.bounds.width / 2
        positionMarkerBackgroundView.clipsToBounds = true
        positionMarkerBackgroundView.layer.backgroundColor = UIColor.sofaBeige2.cgColor
    }
    
    override func setupBinding() {
    }
}

extension FootballStandingsCellView {
    @discardableResult
    func positionLabel(_ label: Int) -> Self {
        positionMarkerLabelView.text = String(label)
        return self
    }
    
    @discardableResult
    func teamLabel(_ label: String) -> Self {
        teamLabelView.text = label
        return self
    }
    @discardableResult
    func playedLabel(_ label: Int) -> Self {
        playedLabelView.text = String(label)
        return self
    }
    @discardableResult
    func winsLabel(_ label: Int) -> Self {
        winsLabelView.text = String(label)
        return self
    }
    @discardableResult
    func drawLabel(_ label: Int) -> Self {
        drawLabelView.text = String(label)
        return self
    }
    @discardableResult
    func lossesLabel(_ label: Int) -> Self {
        lossesLabelView.text = String(label)
        return self
    }
    @discardableResult
    func goalsLabel(scored: Int, conceded: Int) -> Self {
        goalsLabelView.text = "\(scored):\(conceded)"
        return self
    }
    @discardableResult
    func ptsLabel(_ label: Int) -> Self {
        ptsLabelView.text = String(label)
        return self
    }
}
