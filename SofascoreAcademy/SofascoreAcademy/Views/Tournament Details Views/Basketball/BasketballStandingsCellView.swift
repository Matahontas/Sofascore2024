//
//  BasketballStandingsCellView.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 10.06.2024..
//

import Foundation
import SnapKit
import SofaAcademic
import UIKit

class BasketballStandingsCellView: BaseView {
    private let positionMarkerBackgroundView: BaseView = .init()
    private let positionMarkerLabelView: UILabel = .init()
    
    private let teamLabelView: UILabel = .init()
    private let standingsStackView: UIStackView = .init()
    
    private let playedLabelView: UILabel = .init()
    private let winsLabelView: UILabel = .init()
    private let diffLabelView: UILabel = .init()
    private let lossesLabelView: UILabel = .init()
    private let strLabelView: UILabel = .init()
    private let gbLabelView: UILabel = .init()
    private let pctLabelView: UILabel = .init()

    override func addViews() {
        addSubview(positionMarkerBackgroundView)
        positionMarkerBackgroundView.addSubview(positionMarkerLabelView)
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
        
        diffLabelView.font = .tabular
        diffLabelView.textColor = .sofaBlack
        diffLabelView.numberOfLines = 1
        diffLabelView.textAlignment = .center

        strLabelView.font = .tabular
        strLabelView.textColor = .sofaBlack
        strLabelView.numberOfLines = 1
        strLabelView.textAlignment = .center
        
        gbLabelView.font = .tabular
        gbLabelView.textColor = .sofaBlack
        gbLabelView.numberOfLines = 1
        gbLabelView.textAlignment = .center
        
        pctLabelView.font = .tabular
        pctLabelView.textColor = .sofaBlack
        pctLabelView.numberOfLines = 1
        pctLabelView.textAlignment = .center
        
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

extension BasketballStandingsCellView {
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
    func lossesLabel(_ label: Int) -> Self {
        lossesLabelView.text = String(label)
        return self
    }
    @discardableResult
    func diffLabel(_ label: Int) -> Self {
        diffLabelView.text = String(label)
        return self
    }
    @discardableResult
    func strLabel(_ label: Int) -> Self {
        strLabelView.text = String(label)
        return self
    }
    @discardableResult
    func gbLabel(_ label: Double) -> Self {
        gbLabelView.text = String(label)
        return self
    }
    @discardableResult
    func pctLabel(_ label: Double) -> Self {
        pctLabelView.text = String(label)
        return self
    }
}
