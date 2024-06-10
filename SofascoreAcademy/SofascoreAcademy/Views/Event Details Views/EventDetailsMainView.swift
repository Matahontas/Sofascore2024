//
//  EventDetailsMainView.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 07.06.2024..
//

import Foundation
import SnapKit
import SofaAcademic
import UIKit

class EventDetailsMainView: BaseView {
    private let homeTeamContainerView: BaseView = .init()
    private let awayTeamContainerView: BaseView = .init()
    private let homeEventDetailsTeamView: EventDetailsTeamView = .init()
    private let awayEventDetailsTeamView: EventDetailsTeamView = .init()
    private let eventScoreContainer: UIStackView = .init()
    private let homeScoreLabelView: UILabel = .init()
    private let scoreDividerView: UILabel = .init()
    private let awayScoreLabelView: UILabel = .init()
    private let eventTimeContainer: BaseView = .init()
    private let eventTimeLabelView: UILabel = .init()
    
    private let upcomingEventDateLabelView: UILabel = .init()
    private let upcomingEventTimeLabelView: UILabel = .init()
    weak var delegate: TeamDetailsDelegateProtocol?
    
    override func addViews() {
        addSubview(homeTeamContainerView)
        addSubview(awayTeamContainerView)
        homeTeamContainerView.addSubview(homeEventDetailsTeamView)
        awayTeamContainerView.addSubview(awayEventDetailsTeamView)
        
        addSubview(eventScoreContainer)
        eventScoreContainer.addArrangedSubview(homeScoreLabelView)
        eventScoreContainer.addArrangedSubview(scoreDividerView)
        eventScoreContainer.addArrangedSubview(awayScoreLabelView)
        
        addSubview(eventTimeContainer)
        eventTimeContainer.addSubview(eventTimeLabelView)
        
        addSubview(upcomingEventDateLabelView)
        addSubview(upcomingEventTimeLabelView)
    }
    
    override func styleViews() {
        
        homeScoreLabelView.font = .headline1Desktop
        homeScoreLabelView.numberOfLines = 1
        homeScoreLabelView.textAlignment = .right
        
        awayScoreLabelView.font = .headline1Desktop
        awayScoreLabelView.numberOfLines = 1
        awayScoreLabelView.textAlignment = .left
        
        scoreDividerView.font = .headline1Desktop
        scoreDividerView.numberOfLines = 1
        scoreDividerView.textAlignment = .center
        scoreDividerView.text = "-"
        
        eventScoreContainer.axis = .horizontal
        eventScoreContainer.spacing = 4

        eventTimeLabelView.font = .micro
        eventTimeLabelView.numberOfLines = 1
        eventTimeLabelView.textAlignment = .center
        
        upcomingEventDateLabelView.font = .micro
        upcomingEventDateLabelView.textAlignment = .center
        upcomingEventDateLabelView.textColor = .sofaBlack
        upcomingEventDateLabelView.numberOfLines = 1
        
        upcomingEventTimeLabelView.font = .micro
        upcomingEventTimeLabelView.textAlignment = .center
        upcomingEventTimeLabelView.textColor = .sofaBlack
        upcomingEventTimeLabelView.numberOfLines = 1
    }
    
    override func setupConstraints() {
        homeTeamContainerView.snp.makeConstraints {
            $0.top.leading.bottom.equalToSuperview().inset(16)
            $0.width.equalTo(96)
        }
        awayTeamContainerView.snp.makeConstraints {
            $0.top.trailing.bottom.equalToSuperview().inset(16)
            $0.width.equalTo(96)
        }
        homeEventDetailsTeamView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        awayEventDetailsTeamView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        eventScoreContainer.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.leading.equalTo(homeTeamContainerView.snp.trailing)
            $0.trailing.equalTo(awayTeamContainerView.snp.leading)
            $0.bottom.equalToSuperview().inset(56)
        }
        scoreDividerView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
        }
        eventTimeContainer.snp.makeConstraints {
            $0.top.equalTo(eventScoreContainer.snp.bottom)
            $0.leading.equalTo(homeTeamContainerView.snp.trailing)
            $0.trailing.equalTo(awayTeamContainerView.snp.leading)
            $0.height.equalTo(16)
        }
        eventTimeLabelView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.lessThanOrEqualToSuperview()
        }
        upcomingEventDateLabelView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(24)
            $0.leading.equalTo(homeTeamContainerView.snp.trailing)
            $0.trailing.equalTo(awayTeamContainerView.snp.leading)
            $0.bottom.equalToSuperview().inset(72)
        }
        upcomingEventTimeLabelView.snp.makeConstraints {
            $0.top.equalTo(upcomingEventDateLabelView.snp.bottom).offset(4)
            $0.leading.equalTo(homeTeamContainerView.snp.trailing)
            $0.trailing.equalTo(awayTeamContainerView.snp.leading)
        }
        
        upcomingEventDateLabelView.isHidden = true
        upcomingEventTimeLabelView.isHidden = true

    }
    
    override func setupGestureRecognizers() {
        let homeTeamTapGesture = UITapGestureRecognizer(target: self, action: #selector(teamTapped(_:)))
        let awayTeamTapGesture = UITapGestureRecognizer(target: self, action: #selector(teamTapped(_:)))
        homeTeamContainerView.addGestureRecognizer(homeTeamTapGesture)
        awayTeamContainerView.addGestureRecognizer(awayTeamTapGesture)
    }
}

extension EventDetailsMainView {
    @objc private func teamTapped(_ sender: UITapGestureRecognizer) {
        guard let teamId = sender.view?.tag else { return }
        delegate?.teamTapped(teamTappedIndex: teamId)
    }
    
    @discardableResult
    func setHomeTeamTag(_ eventId: Int) -> Self {
        homeTeamContainerView.tag = eventId
        return self
    }
    @discardableResult
    func setAwayTeamTag(_ eventId: Int) -> Self {
        awayTeamContainerView.tag = eventId
        return self
    }
    
    @discardableResult
    func homeTeamImage(_ URLString: String, placeHolder: UIImage?) -> Self {
        homeEventDetailsTeamView.teamImage(URLString, placeHolder: placeHolder)
        return self
    }
    
    @discardableResult
    func homeTeamLabel(_ label: String) -> Self {
        homeEventDetailsTeamView.teamLabel(label)
        return self
    }
    
    @discardableResult
    func awayTeamImage(_ URLString: String, placeHolder: UIImage?) -> Self {
        awayEventDetailsTeamView.teamImage(URLString, placeHolder: placeHolder)
        return self
    }
    
    @discardableResult
    func awayTeamLabel(_ label: String) -> Self {
        awayEventDetailsTeamView.teamLabel(label)
        return self
    }
    
    @discardableResult
    func homeScoreLabel(_ homeScore: Int) -> Self {
        if homeScore == -1 {
            homeScoreLabelView.text = "TODO"
        } else {
            homeScoreLabelView.text = "\(homeScore)"
        }
        return self
    }
    @discardableResult
    func awayScoreLabel(_ awayScore: Int) -> Self {
        if awayScore == -1 {
            awayScoreLabelView.text = "TODO"
        } else {
            awayScoreLabelView.text = "\(awayScore)"
        }
        return self
    }
    
    @discardableResult
    func eventTimeLabel(_ time: String) -> Self {
        let dateFormatter = DateFormatter()
        let formattedTime: String
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let date = dateFormatter.date(from: time) {
            let dateComponents = Calendar.current.dateComponents([.hour, .minute], from: date)
            let nowComponents = Calendar.current.dateComponents([.hour, .minute], from: Date())
            let minutesDifference = Calendar.current.dateComponents([.minute], from: dateComponents, to: nowComponents).minute ?? 0
            formattedTime = String(minutesDifference)
        } else {
            formattedTime = time
        }
        eventTimeLabelView.text = formattedTime
        return self
    }
    @discardableResult
    func homeScoreColor(_ color: UIColor) -> Self {
        homeScoreLabelView.textColor = color
        return self
    }
    @discardableResult
    func awayScoreColor(_ color: UIColor) -> Self {
        awayScoreLabelView.textColor = color
        return self
    }
    @discardableResult
    func eventTimeLabelColor(_ color: UIColor) -> Self {
        eventTimeLabelView.textColor = color
        return self
    }
    @discardableResult
    func scoreDividerColor(_ color: UIColor) -> Self {
        scoreDividerView.textColor = color
        return self
    }
    
    @discardableResult
    func upcomingDateLabel(_ date: String) -> Self {
        let dateFormatter = DateFormatter()
        let formattedTime: String
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let date = dateFormatter.date(from: date) {
            let day = Calendar.current.component(.day, from: date)
            let month = Calendar.current.component(.month, from: date)
            let year = Calendar.current.component(.year, from: date)
            formattedTime = String(format: "%02d.%02d.%02d.", day, month, year)
        } else {
            formattedTime = "-"
        }
        upcomingEventDateLabelView.text = formattedTime
        return self
    }
    
    @discardableResult
    func upcomingTimeLabel(_ date: String) -> Self {
        let dateFormatter = DateFormatter()
        let formattedTime: String
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let date = dateFormatter.date(from: date) {
            let hour = Calendar.current.component(.hour, from: date)
            let minute = Calendar.current.component(.minute, from: date)
            formattedTime = String(format: "%02d:%02d", hour, minute)
        } else {
            formattedTime = "-"
        }
        upcomingEventTimeLabelView.text = formattedTime
        return self
    }
    
    func updateViewBasedOn(_ condition: Bool) {
        upcomingEventDateLabelView.isHidden = !condition
        upcomingEventTimeLabelView.isHidden = !condition
        
        eventScoreContainer.isHidden = condition
        homeScoreLabelView.isHidden = condition
        scoreDividerView.isHidden = condition
        awayScoreLabelView.isHidden = condition
        eventTimeContainer.isHidden = condition
        eventTimeLabelView.isHidden = condition
    }
}
