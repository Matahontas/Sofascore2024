//
//  EventCellView.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 15.03.2024..
//

import Foundation
import SnapKit
import SofaAcademic
import UIKit

class EventCellView: BaseView {
    
    let timeCellView: TimeCellView = .init()
    let homeTeamCellView: TeamCellView = .init()
    let awayTeamCellView: TeamCellView = .init()
    let homeScoreLabel: UILabel = .init()
    let awayScoreLabel: UILabel = .init()
    
    override func addViews() {
        addSubview(timeCellView)
        addSubview(homeTeamCellView)
        addSubview(awayTeamCellView)
        addSubview(homeScoreLabel)
        addSubview(awayScoreLabel)
    }
    
    override func styleViews() {
        homeScoreLabel.font = .body
        awayScoreLabel.font = .body
        
        homeScoreLabel.numberOfLines = 1
        awayScoreLabel.numberOfLines = 1
        
        homeScoreLabel.textAlignment = .right
        awayScoreLabel.textAlignment = .right
    }

    override func setupConstraints() {
        timeCellView.snp.makeConstraints {
            $0.width.equalTo(64)
            $0.top.leading.bottom.equalToSuperview()
        }
        homeTeamCellView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalTo(timeCellView.snp.trailing).offset(16)
            $0.bottom.equalToSuperview().inset(30)
        }
        awayTeamCellView.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(10)
            $0.leading.equalTo(timeCellView.snp.trailing).offset(16)
            $0.trailing.equalToSuperview().inset(64)
        }
        homeScoreLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalTo(homeTeamCellView).inset(16)
            $0.trailing.equalToSuperview().inset(16)
        }
        awayScoreLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(10)
            $0.leading.equalTo(awayTeamCellView).inset(16)
            $0.trailing.equalToSuperview().inset(16)
        }
    }
}

extension EventCellView {
    
    @discardableResult
    func homeTeamLabelColor(_ color: UIColor) -> Self {
        homeTeamCellView.teamLabel.textColor = color
        return self
    }
    
    @discardableResult
    func awayTeamLabelColor(_ color: UIColor) -> Self {
        awayTeamCellView.teamLabel.textColor = color
        return self
    }
    
    @discardableResult
    func homeScoreLabelColor(_ color: UIColor) -> Self {
        homeScoreLabel.textColor = color
        return self
    }
    
    @discardableResult
    func awayScoreLabelColor(_ color: UIColor) -> Self {
        awayScoreLabel.textColor = color
        return self
    }
}
