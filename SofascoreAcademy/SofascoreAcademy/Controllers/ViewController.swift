//
//  ViewController.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 11.03.2024..
//
import SnapKit
import SofaAcademic
import UIKit

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
        spainTournamentCell.logoImageView.image = tournament.leagueLogo
        
        events.forEach {
            let view: EventCellView = .init()
            view.homeTeamCellView.teamImageView.image = $0.homeTeamLogo
            view.awayTeamCellView.teamImageView.image = $0.awayTeamLogo
            view.homeTeamCellView.teamLabel.text = $0.homeTeamName
            view.awayTeamCellView.teamLabel.text = $0.awayTeamName
            view.homeScoreLabel.text = $0.homeTeamScore
            view.awayScoreLabel.text = $0.awayTeamScore
            view.timeCellView.startTimeLabel.text = EventDateHelper.getStartTime(for: $0.startTimestamp)
            view.timeCellView.matchTimeLabel.text = EventDateHelper.getMatchMinute(for: $0.matchMinute)

            switch $0.matchStatus {
            case .notStarted:
                view.homeTeamLabelColor(.sofaBlack)
                view.awayTeamLabelColor(.sofaBlack)
            case .inProgress:
                view.homeTeamLabelColor(.sofaBlack)
                view.awayTeamLabelColor(.sofaBlack)
                view.homeScoreLabelColor(.sofaRed)
                view.awayScoreLabelColor(.sofaRed)
                view.timeCellView.matchTimeLabel.textColor = .sofaRed
            case .finished:
                view.homeTeamLabelColor(EventDateHelper.calculateWinner(home: $0.homeTeamScore, away: $0.awayTeamScore)["home"] ?? .sofaBlack)
                view.homeScoreLabelColor(EventDateHelper.calculateWinner(home: $0.homeTeamScore, away: $0.awayTeamScore)["home"] ?? .sofaBlack)
                view.awayTeamLabelColor(EventDateHelper.calculateWinner(home: $0.homeTeamScore, away: $0.awayTeamScore)["away"] ?? .sofaBlack)
                view.awayScoreLabelColor(EventDateHelper.calculateWinner(home: $0.homeTeamScore, away: $0.awayTeamScore)["away"] ?? .sofaBlack)
            }
            
            eventsViewArray.append(view)
        }
        
        eventsViewArray.forEach {
            eventsStack.addArrangedSubview($0)
        }
        
        spainTournamentCell.snp.makeConstraints {
           $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(16)
           $0.leading.trailing.equalToSuperview()
        }
        eventsStack.snp.makeConstraints {
            $0.top.equalTo(spainTournamentCell.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
    }
}
