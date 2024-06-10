//
//  BasketballAwayGoalIncidentView.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 09.06.2024..
//

import Foundation
import SnapKit
import SofaAcademic
import UIKit

class BasketballAwayGoalIncidentView: BaseView {
    private let iconImageView: UIImageView = .init()
    private let verticalDividerView: UIView = .init()
    private let currentScoreLabelView: UILabel = .init()
    private let horizontalDividerView: UIView = .init()
    private let incidentMinuteLabelView: UILabel = .init()
    
    override func addViews() {
        addSubview(iconImageView)
        addSubview(verticalDividerView)
        addSubview(currentScoreLabelView)
        addSubview(horizontalDividerView)
        addSubview(incidentMinuteLabelView)
    }
    
    override func styleViews() {
        verticalDividerView.backgroundColor = .sofaGray
        horizontalDividerView.backgroundColor = .sofaGray
        
        incidentMinuteLabelView.font = .micro
        incidentMinuteLabelView.textColor = .sofaGray
        incidentMinuteLabelView.textAlignment = .center
        incidentMinuteLabelView.numberOfLines = 1
        
        currentScoreLabelView.font = .headline3
        currentScoreLabelView.textColor = .sofaBlack
        currentScoreLabelView.numberOfLines = 1
        currentScoreLabelView.textAlignment = .center
    }

    override func setupConstraints() {
        iconImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(8)
            $0.trailing.equalToSuperview().inset(16)
            $0.size.equalTo(24)
        }
        verticalDividerView.snp.makeConstraints {
            $0.trailing.equalTo(iconImageView.snp.leading).offset(-15)
            $0.top.bottom.equalToSuperview().inset(8)
            $0.width.equalTo(1)
        }
        incidentMinuteLabelView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        currentScoreLabelView.snp.makeConstraints {
            $0.trailing.equalTo(verticalDividerView.snp.leading).offset(4)
            $0.top.bottom.equalToSuperview().inset(12)
            $0.leading.equalTo(incidentMinuteLabelView.snp.trailing).offset(28)
        }
        horizontalDividerView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.width.equalTo(24)
            $0.height.equalTo(1)
        }
    }
}

extension BasketballAwayGoalIncidentView {
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
    func currentScore(_ currentScore: String) -> Self {
        currentScoreLabelView.text = currentScore
        return self
    }
}
