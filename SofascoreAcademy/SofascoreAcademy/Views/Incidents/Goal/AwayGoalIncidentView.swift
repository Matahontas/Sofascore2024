//
//  AwayGoalIncidentView.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 09.06.2024..
//

import Foundation
import SnapKit
import SofaAcademic
import UIKit

class AwayGoalIncidentView: BaseView {
    private let preDividerContainer: BaseView = .init()
    private let iconImageView: UIImageView = .init()
    private let incidentMinuteLabelView: UILabel = .init()
    private let dividerView: UIView = .init()
    private let stackView: UIStackView = .init()
    private let currentScoreLabelView: UILabel = .init()
    private let playerNameLabelView: UILabel = .init()
    
    override func addViews() {
        addSubview(preDividerContainer)
        preDividerContainer.addSubview(iconImageView)
        preDividerContainer.addSubview(incidentMinuteLabelView)
        preDividerContainer.addSubview(dividerView)
        addSubview(stackView)
        stackView.addArrangedSubview(playerNameLabelView)
        stackView.addArrangedSubview(currentScoreLabelView)
    }
    
    override func styleViews() {
        dividerView.backgroundColor = .sofaGray
        
        incidentMinuteLabelView.font = .micro
        incidentMinuteLabelView.textColor = .sofaGray
        incidentMinuteLabelView.textAlignment = .center
        incidentMinuteLabelView.numberOfLines = 1
        
        playerNameLabelView.font = .body
        playerNameLabelView.textColor = .sofaBlack
        playerNameLabelView.numberOfLines = 1
        
        currentScoreLabelView.font = .headline1
        currentScoreLabelView.textColor = .sofaBlack
        currentScoreLabelView.numberOfLines = 1
        
        stackView.axis = .horizontal
        stackView.spacing = 28
    }

    override func setupConstraints() {
        preDividerContainer.snp.makeConstraints {
            $0.trailing.top.bottom.equalToSuperview()
            $0.width.equalTo(56)
        }
        dividerView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.bottom.equalToSuperview().inset(8)
            $0.width.equalTo(1)
        }
        iconImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(8)
            $0.trailing.equalToSuperview().inset(16)
            $0.size.equalTo(24)
        }
        incidentMinuteLabelView.snp.makeConstraints {
            $0.top.equalTo(iconImageView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(8)
        }
        stackView.snp.makeConstraints {
            $0.trailing.equalTo(preDividerContainer.snp.leading).offset(-8)
            $0.top.bottom.equalToSuperview().inset(14)
        }
    }
}

extension AwayGoalIncidentView {
    @discardableResult
    func iconImage(_ image: UIImage) -> Self {
        iconImageView.image = image
        return self
    }
    @discardableResult
    func incidentMinute(_ minute: Int) -> Self {
        incidentMinuteLabelView.text = "\(minute)'"
        return self
    }
    @discardableResult
    func playerName(_ name: String) -> Self {
        playerNameLabelView.text = name
        return self
    }
    @discardableResult
    func currentScore(_ currentScore: String) -> Self {
        currentScoreLabelView.text = currentScore
        return self
    }
}
