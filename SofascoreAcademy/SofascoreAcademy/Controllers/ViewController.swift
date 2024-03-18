//
//  ViewController.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 11.03.2024..
//

import UIKit
import SnapKit
import SofaAcademic

class ViewController: UIViewController {
    let spainTournamentCell: TournamentCellView = .init()
    let eventsStack: UIStackView = .init()
    var eventsViewArray: [EventCellView] = .init()
    var tournament = TournamentCellModel.sampleData
    var events = EventCellModel.sampleData

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        
        self.view.addSubview(spainTournamentCell)
        self.view.addSubview(eventsStack)
       
        eventsStack.axis = .vertical
        
        spainTournamentCell.countryLabel.text = tournament.countryName
        spainTournamentCell.leagueLabel.text = tournament.leagueName
        spainTournamentCell.logoImage.image = tournament.leagueLogo
        
        events.forEach {
            let view: EventCellView = .init(matchStatus: $0.matchStatus)
            view.homeTeamLogo.image = $0.homeTeamLogo
            view.awayTeamLogo.image = $0.awayTeamLogo
            view.homeTeamLabel.text = $0.homeTeamLabel
            view.awayTeamLabel.text = $0.awayTeamLabel
            view.homeScore.text = $0.homeTeamScore
            view.awayScore.text = $0.awayTeamScore
            view.startTime.text = EventCellController().convertMatchStartTimestamp(timestamp: $0.matchStartTime)
            view.matchTime.text = EventCellController().convertMatchMinuteTimestamp(timestamp: $0.matchMinute)
            if view.matchStatus == .finished {
                view.homeTeamLabel.alpha = EventCellController().calculateWinner(home: $0.homeTeamScore, away: $0.awayTeamScore)["home"] ?? 1
                view.awayTeamLabel.alpha = EventCellController().calculateWinner(home: $0.homeTeamScore, away: $0.awayTeamScore)["away"] ?? 1
                view.homeScore.alpha = EventCellController().calculateWinner(home: $0.homeTeamScore, away: $0.awayTeamScore)["home"] ?? 1
                view.awayScore.alpha = EventCellController().calculateWinner(home: $0.homeTeamScore, away: $0.awayTeamScore)["away"] ?? 1
            }

            
            eventsViewArray.append(view)
        }
        
        eventsViewArray.forEach {
            eventsStack.addArrangedSubview($0)
        }
        
        spainTournamentCell.snp.makeConstraints {
           $0.height.equalTo(56)
           $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(16)
           $0.leading.trailing.equalToSuperview()
        }
        eventsStack.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(72)
            $0.leading.trailing.equalToSuperview()
        }
        eventsViewArray.forEach {
            $0.snp.makeConstraints {
                $0.height.equalTo(56)
            }
        }
    }
}

