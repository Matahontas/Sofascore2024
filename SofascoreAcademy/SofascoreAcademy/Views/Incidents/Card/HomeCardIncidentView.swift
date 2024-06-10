//
//  HomeCardIncidentView.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 08.06.2024..
//

import Foundation
import SnapKit
import SofaAcademic
import UIKit

class HomeCardIncidentView: BaseView {
    private let preDividerContainer: BaseView = .init()
    private let cardImageView: UIImageView = .init()
    private let incidentMinuteLabelView: UILabel = .init()
    private let dividerView: UIView = .init()
    private let playerNameLabelView: UILabel = .init()
    private let incidentDescriptionLabelView: UILabel = .init()
    
    override func addViews() {
        addSubview(preDividerContainer)
        preDividerContainer.addSubview(cardImageView)
        preDividerContainer.addSubview(incidentMinuteLabelView)
        preDividerContainer.addSubview(dividerView)
        addSubview(playerNameLabelView)
        addSubview(incidentDescriptionLabelView)
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
        
        incidentDescriptionLabelView.font = .micro
        incidentDescriptionLabelView.textColor = .sofaGray
        incidentDescriptionLabelView.numberOfLines = 1
    }

    override func setupConstraints() {
        preDividerContainer.snp.makeConstraints {
            $0.leading.top.bottom.equalToSuperview()
            $0.width.equalTo(56)
        }
        dividerView.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.top.bottom.equalToSuperview().inset(8)
            $0.width.equalTo(1)
        }
        cardImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(8)
            $0.leading.equalToSuperview().inset(16)
            $0.size.equalTo(24)
        }
        incidentMinuteLabelView.snp.makeConstraints {
            $0.top.equalTo(cardImageView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(8)
        }
        playerNameLabelView.snp.makeConstraints {
            $0.leading.equalTo(preDividerContainer.snp.trailing).offset(12)
            $0.top.equalToSuperview().inset(12)
            $0.trailing.equalToSuperview().inset(16)
        }
        incidentDescriptionLabelView.snp.makeConstraints {
            $0.top.equalTo(playerNameLabelView.snp.bottom)
            $0.leading.equalTo(preDividerContainer.snp.trailing).offset(12)
            $0.trailing.equalToSuperview().inset(16)
        }
    }
}

extension HomeCardIncidentView {
    @discardableResult
    func cardImage(_ image: UIImage) -> Self {
        cardImageView.image = image
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
    func incidentDescription(_ description: String) -> Self {
        incidentDescriptionLabelView.text = description
        return self
    }
}
