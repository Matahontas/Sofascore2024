//
//  ViewController.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 11.03.2024..
//
import Foundation
import SnapKit
import SofaAcademic
import UIKit

class ViewController: UIViewController {
    
    private let spainTournamentHeaderView: TournamentHeaderView = .init()
    private let eventsStackView: UIStackView = .init()
    private var eventsViewArray: [EventView] = .init()
    private let tournament = TournamentHeaderModel.sampleData[0]
    private let events = EventModel.sampleData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        self.view.addSubview(spainTournamentHeaderView)
        self.view.addSubview(eventsStackView)
        
        eventsStackView.axis = .vertical
        
        spainTournamentHeaderView.countryName(tournament.countryName)
        spainTournamentHeaderView.leagueName(tournament.leagueName)
        spainTournamentHeaderView.leagueLogo(tournament.leagueLogo)
        
        events.forEach {
            let eventView: EventView = .init()
            
            eventView.homeTeamImage($0.homeTeamLogo)
            eventView.homeTeamLabel($0.homeTeamName)
            eventView.homeTeamScore($0.homeTeamScore)
            
            eventView.awayTeamImage($0.awayTeamLogo)
            eventView.awayTeamLabel($0.awayTeamName)
            eventView.awayTeamScore($0.awayTeamScore)
            
            eventView.startTime(EventDateHelper.getStartTime(for: $0.startTimestamp))
            eventView.matchTime(EventDateHelper.getMatchMinute(for: $0.matchMinute))
            
            switch $0.matchStatus {
            case .notStarted:
                eventView.homeTeamLabelColor(.sofaBlack)
                eventView.awayTeamLabelColor(.sofaBlack)
            case .inProgress:
                eventView.homeTeamLabelColor(.sofaBlack)
                eventView.homeScoreLabelColor(.sofaRed)
                eventView.awayTeamLabelColor(.sofaBlack)
                eventView.awayScoreLabelColor(.sofaRed)
                eventView.matchTimeColor(.sofaRed)
            case .finished:
                eventView.homeTeamLabelColor($0.winnerCode == 1 ? .sofaBlack : .sofaGray)
                eventView.homeScoreLabelColor($0.winnerCode == 1 ? .sofaBlack : .sofaGray)
                eventView.awayTeamLabelColor($0.winnerCode == 2 ? .sofaBlack : .sofaGray)
                eventView.awayScoreLabelColor($0.winnerCode == 2 ? .sofaBlack : .sofaGray)
            }
            
            eventsViewArray.append(eventView)
        }
        
        eventsViewArray.forEach {
            eventsStackView.addArrangedSubview($0)
        }

        spainTournamentHeaderView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(16)
            $0.leading.trailing.equalToSuperview()
        }
        eventsStackView.snp.makeConstraints {
            $0.top.equalTo(spainTournamentHeaderView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
    }
}

#Preview {
    ViewController()
}
