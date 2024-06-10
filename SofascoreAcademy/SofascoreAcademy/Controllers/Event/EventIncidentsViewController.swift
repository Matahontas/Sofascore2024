//
//  EventIncidentsController.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 08.06.2024..
//

import Foundation
import SnapKit
import SofaAcademic
import UIKit

class EventIncidentsViewController: UIViewController, BaseViewProtocol {
    private let tableView: UITableView = .init()
    private var eventIncidents: [EventIncidentsResponse] = []
    private let playerDetailsViewController: PlayerDetailsViewController = .init()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
        setupConstraints()
        styleViews()
    }
    
    func addViews() {
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func styleViews() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PeriodIncidentViewCell.self, forCellReuseIdentifier: "PeriodIncidentCell")
        tableView.register(HomeCardIncidentViewCell.self, forCellReuseIdentifier: "HomeCardIncidentCell")
        tableView.register(AwayCardIncidentViewCell.self, forCellReuseIdentifier: "AwayCardIncidentCell")
        tableView.register(HomeGoalIncidentViewCell.self, forCellReuseIdentifier: "HomeGoalIncidentCell")
        tableView.register(AwayGoalIncidentViewCell.self, forCellReuseIdentifier: "AwayGoalIncidentCell")
        tableView.register(BasketballHomeGoalIncidentViewCell.self, forCellReuseIdentifier: "BasketballHomeGoalIncidentCell")
        tableView.register(BasketballAwayGoalIncidentViewCell.self, forCellReuseIdentifier: "BasketballAwayGoalIncidentCell")
        tableView.reloadData()
        tableView.separatorStyle = .none
        tableView.backgroundColor = .sofaGrayBackground
    }
}

extension EventIncidentsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        eventIncidents.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if eventIncidents[indexPath.row].type == "period"
            || eventIncidents[indexPath.row].goalType == "onepoint"
            || eventIncidents[indexPath.row].goalType == "twopoint"
            || eventIncidents[indexPath.row].goalType == "threepoint" {
            return 40
        }
        return 56
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let eventIncident = eventIncidents[indexPath.row]
        //PERIOD
        if eventIncident.type == "period" {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PeriodIncidentCell", for: indexPath) as? PeriodIncidentViewCell
            else {
                return UITableViewCell()
            }
            cell.set(eventIncident)
            return cell
        }
        //CARD
        if eventIncident.type == "card" {
            //HOME
            if eventIncident.teamSide == "home" {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCardIncidentCell", for: indexPath) as? HomeCardIncidentViewCell
                else {
                    return UITableViewCell()
                }
                cell.set(eventIncident)
                return cell
            }
            //AWAY
            if eventIncident.teamSide == "away" {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "AwayCardIncidentCell", for: indexPath) as? AwayCardIncidentViewCell
                else {
                    return UITableViewCell()
                }
                cell.set(eventIncident)
                return cell
            }
        }
        //GOAL
        if eventIncident.type == "goal" {
            //HOME
            if eventIncident.scoringTeam == "home" {
                //BASKETBALL CHECK
                if eventIncident.goalType == "onepoint"
                    || eventIncident.goalType == "twopoint"
                    || eventIncident.goalType == "threepoint" {
                    guard let cell = tableView.dequeueReusableCell(withIdentifier: "BasketballHomeGoalIncidentCell", for: indexPath) as? BasketballHomeGoalIncidentViewCell
                    else {
                        return UITableViewCell()
                    }
                    cell.set(eventIncident)
                    return cell
                }
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeGoalIncidentCell", for: indexPath) as? HomeGoalIncidentViewCell
                else {
                    return UITableViewCell()
                }
                cell.set(eventIncident)
                return cell
            }
            //AWAY
            if eventIncident.scoringTeam == "away" {
                //BASKETBALL CHECK
                if eventIncident.goalType == "onepoint"
                    || eventIncident.goalType == "twopoint"
                    || eventIncident.goalType == "threepoint" {
                    guard let cell = tableView.dequeueReusableCell(withIdentifier: "BasketballAwayGoalIncidentCell", for: indexPath) as? BasketballAwayGoalIncidentViewCell
                    else {
                        return UITableViewCell()
                    }
                    cell.set(eventIncident)
                    return cell
                }
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "AwayGoalIncidentCell", for: indexPath) as? AwayGoalIncidentViewCell
                else {
                    return UITableViewCell()
                }
                cell.set(eventIncident)
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { 
        let eventIncident = eventIncidents[indexPath.row]
        guard let playerId = eventIncident.player?.id else { return }
        self.eventIncidentTapped(playerId)
    }
}

extension EventIncidentsViewController {
    @discardableResult
    func appendEventIncidents(_ eventIncidents: [EventIncidentsResponse]) -> Self { 
        self.eventIncidents = eventIncidents
        tableView.reloadData()
        return self
    }
    
    @objc func eventIncidentTapped(_ playerId: Int) {
        navigationController?.pushViewController(playerDetailsViewController, animated: true)
    }
}
