//
//  EventView.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 22.03.2024..
//

import Foundation
import SnapKit
import SofaAcademic
import UIKit

class EventView: BaseView {
    
    private let matchTimeView: MatchTimeView = .init()
    private let homeTeamView: TeamView = .init()
    private let awayTeamView: TeamView = .init()
    private let homeScoreLabel: UILabel = .init()
    private let awayScoreLabel: UILabel = .init()
    
    override func addViews() {
        addSubview(matchTimeView)
        addSubview(homeTeamView)
        addSubview(awayTeamView)
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
        matchTimeView.snp.makeConstraints {
            $0.width.equalTo(64)
            $0.top.leading.bottom.equalToSuperview()
        }
        homeTeamView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalTo(matchTimeView.snp.trailing).offset(16)
            $0.trailing.equalTo(homeScoreLabel.snp.leading).offset(16)
        }
        awayTeamView.snp.makeConstraints {
            $0.top.equalTo(homeTeamView.snp.bottom).offset(4)
            $0.bottom.equalToSuperview().inset(10)
            $0.leading.equalTo(matchTimeView.snp.trailing).offset(16)
        }
        homeScoreLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalTo(homeTeamView.snp.trailing).offset(16)
            $0.trailing.equalToSuperview().inset(16)
        }
        awayScoreLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(10)
            $0.leading.equalTo(awayTeamView.snp.trailing).offset(16)
            $0.trailing.equalToSuperview().inset(16)
        }
    }
}

extension EventView {
    
    @discardableResult
    func homeTeamImage(_ image: UIImage) -> Self {
        homeTeamView.teamImage(image)
        return self
    }
    
    @discardableResult
    func homeTeamLabel(_ label: String) -> Self {
        homeTeamView.teamLabel(label)
        return self
    }
    
    @discardableResult
    func homeTeamLabelColor(_ color: UIColor) -> Self {
        homeTeamView.teamLabelColor(color)
        return self
    }
    
    @discardableResult
    func homeTeamScore(_ score: String) -> Self {
        homeScoreLabel.text = score
        return self
    }
    
    @discardableResult
    func homeScoreLabelColor(_ color: UIColor) -> Self {
        homeScoreLabel.textColor = color
        return self
    }
    
    @discardableResult
    func awayTeamImage(_ image: UIImage) -> Self {
        awayTeamView.teamImage(image)
        return self
    }
    
    @discardableResult
    func awayTeamLabel(_ label: String) -> Self {
        awayTeamView.teamLabel(label)
        return self
    }
    
    @discardableResult
    func awayTeamLabelColor(_ color: UIColor) -> Self {
        awayTeamView.teamLabelColor(color)
        return self
    }
    
    @discardableResult
    func awayTeamScore(_ score: String) -> Self {
        awayScoreLabel.text = score
        return self
    }
    
    @discardableResult
    func awayScoreLabelColor(_ color: UIColor) -> Self {
        awayScoreLabel.textColor = color
        return self
    }
    
    @discardableResult
    func startTime(_ time: String) -> Self {
        matchTimeView.startTime(time)
        return self
    }
    
    @discardableResult
    func matchTime(_ time: String) -> Self {
        matchTimeView.matchTime(time)
        return self
    }
    
    @discardableResult
    func matchTimeColor(_ color: UIColor) -> Self {
        matchTimeView.matchTimeColor(color)
        return self
    }
}
