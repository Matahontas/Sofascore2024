//
//  EventCellView.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 15.03.2024..
//

import Foundation
import UIKit
import SofaAcademic
import SnapKit

class EventCellView: BaseView {
    
    let timeCell: UIView = .init()
    let startTime: UILabel = .init()
    let matchTime: UILabel = .init()
    let homeTeamStack: UIStackView = .init()
    let awayTeamStack: UIStackView = .init()
    let homeTeamLogo: UIImageView = .init()
    let homeTeamLabel: UILabel = .init()
    let awayTeamLogo: UIImageView = .init()
    let awayTeamLabel: UILabel = .init()
    let homeScore: UILabel = .init()
    let awayScore: UILabel = .init()
    let dividerView: UIView = .init()
    var matchStatus: MatchStatus
    
    init(matchStatus: MatchStatus) {
        self.matchStatus = matchStatus
        super.init()
    }
    
    override func addViews() {
        addSubview(timeCell)
        addSubview(homeTeamStack)
        addSubview(awayTeamStack)
        addSubview(homeScore)
        addSubview(awayScore)
        timeCell.addSubview(startTime)
        timeCell.addSubview(matchTime)
        timeCell.addSubview(dividerView)
        homeTeamStack.addArrangedSubview(homeTeamLogo)
        homeTeamStack.addArrangedSubview(homeTeamLabel)
        awayTeamStack.addArrangedSubview(awayTeamLogo)
        awayTeamStack.addArrangedSubview(awayTeamLabel)
    }
    
    override func styleViews() {
        
        dividerView.backgroundColor = .sofaGray
        
        homeTeamStack.spacing = 8
        awayTeamStack.spacing = 8

        homeTeamLabel.font = Fonts.body
        awayTeamLabel.font = Fonts.body
        homeScore.font = Fonts.body
        awayScore.font = Fonts.body
        startTime.font = Fonts.tabular
        matchTime.font = Fonts.tabular
        
        homeTeamLabel.numberOfLines = 1
        awayTeamLabel.numberOfLines = 1
        homeScore.numberOfLines = 1
        awayScore.numberOfLines = 1
        startTime.numberOfLines = 1
        matchTime.numberOfLines = 1
        
        homeScore.textAlignment = .right
        awayScore.textAlignment = .right
        startTime.textAlignment = .center
        matchTime.textAlignment = .center
        
        startTime.textColor = .sofaGray
        matchTime.textColor = .sofaGray
        
        switch matchStatus {
        case .notStarted:
            homeTeamLabel.textColor = .sofaBlack
            awayTeamLabel.textColor = .sofaBlack
        case .inProgress:
            homeScore.textColor = .sofaRed
            awayScore.textColor = .sofaRed
            matchTime.textColor = .sofaRed
        case .finished:
            homeTeamLabel.textColor = .sofaBlack
            awayTeamLabel.textColor = .sofaBlack
        }
    }

    
    override func setupConstraints() {
        timeCell.snp.makeConstraints {
            $0.width.equalTo(64)
            $0.height.top.leading.equalToSuperview()
        }
        homeTeamStack.snp.makeConstraints {
            $0.width.equalTo(216)
            $0.height.equalTo(16)
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(80)
        }
        awayTeamStack.snp.makeConstraints {
            $0.width.equalTo(216)
            $0.height.equalTo(16)
            $0.bottom.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(80)
        }
        homeTeamLogo.snp.makeConstraints {
            $0.width.height.equalTo(16)
            $0.top.leading.equalToSuperview()
        }
        awayTeamLogo.snp.makeConstraints {
            $0.width.height.equalTo(16)
            $0.top.leading.equalToSuperview()
        }
        homeScore.snp.makeConstraints {
            $0.width.equalTo(32)
            $0.height.equalTo(16)
            $0.top.equalToSuperview().inset(10)
            $0.trailing.equalToSuperview().inset(16)
        }
        awayScore.snp.makeConstraints {
            $0.width.equalTo(32)
            $0.height.equalTo(16)
            $0.bottom.equalToSuperview().inset(10)
            $0.trailing.equalToSuperview().inset(16)
        }
        startTime.snp.makeConstraints {
            $0.width.equalTo(56)
            $0.height.equalTo(16)
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(4)
        }
        matchTime.snp.makeConstraints {
            $0.width.equalTo(56)
            $0.height.equalTo(16)
            $0.bottom.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(4)
        }
        dividerView.snp.makeConstraints {
            $0.width.equalTo(1)
            $0.height.equalTo(40)
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview().inset(8)

        }
    }

    

    
    override func setupBinding() {
        
    }
}
