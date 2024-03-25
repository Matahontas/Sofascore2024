//
//  EventsViewController.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 21.03.2024..
//

import Foundation
import SnapKit
import SofaAcademic
import UIKit

class EventsViewController: UIViewController {
    
    var tournaments = TournamentHeaderModel.sampleData
    var events = EventModel.sampleData
    
    let tableView: UITableView = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(tableView)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(EventTableCell.self, forCellReuseIdentifier: "EventTableCell")
        tableView.register(TournamentTableHeader.self, forHeaderFooterViewReuseIdentifier: "TournamentTableHeader")
        
        tableView.separatorStyle = .none
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        tableView.reloadData()
    }
}

extension EventsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tournaments.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            events[tournaments[section].countryName]?.count ?? 0
        case 1:
            events[tournaments[section].countryName]?.count ?? 0
        case 2:
            events[tournaments[section].countryName]?.count ?? 0
        case 3:
            events[tournaments[section].countryName]?.count ?? 0
        case 4:
            events[tournaments[section].countryName]?.count ?? 0
        default:
            0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let event = events[tournaments[indexPath.section].countryName]?[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EventTableCell", for: indexPath) as? EventTableCell
        else {
            return UITableViewCell()
        }
        
        cell.set(startTimestamp: event?.startTimestamp ?? 0, matchMinute: event?.matchMinute ?? "", homeTeamLogo: event?.homeTeamLogo ?? UIImage(), awayTeamLogo: event?.awayTeamLogo ?? UIImage(), homeTeamName: event?.homeTeamName ?? "", awayTeamName: event?.awayTeamName ?? "", homeTeamScore: event?.homeTeamScore ?? "", awayTeamScore: event?.awayTeamScore ?? "", matchStatus: event?.matchStatus ?? .notStarted)
        
        EventStatusHelper.matchStatusStyling(for: cell, event: event ?? EventModel.emptyEventModel)

        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let tournament = tournaments[section]
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "TournamentTableHeader") as? TournamentTableHeader
        else {
            return UIView()
        }
        
        header.set(countryName: tournament.countryName, leagueName: tournament.leagueName, leagueLogo: tournament.leagueLogo)
        
        return header
    }
}

#Preview {
    EventsViewController()
}
