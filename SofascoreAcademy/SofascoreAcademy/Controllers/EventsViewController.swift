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

class EventsViewController: UIViewController, BaseViewProtocol {
    
    private let tableView: UITableView = .init()
    private var eventsByTournament: [Int:[EventResponse]] = [:]
    private var sortedTournamentIds: [Int] = []
    
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
        tableView.register(TournamentTableHeader.self, forHeaderFooterViewReuseIdentifier: "TournamentTableHeader")
        tableView.register(EventTableCell.self, forCellReuseIdentifier: "EventTableCell")
        tableView.reloadData()
        tableView.separatorStyle = .none
    }
}

extension EventsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        sortedTournamentIds.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let tournamentId = sortedTournamentIds[section]
        return eventsByTournament[tournamentId]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EventTableCell", for: indexPath) as? EventTableCell
        else {
            return UITableViewCell()
        }
        let tournamentId = sortedTournamentIds[indexPath.section]
        
        guard let event = eventsByTournament[tournamentId]?[indexPath.row] else {
            return UITableViewCell()
        }
        
        cell.set(eventResponse: event)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.eventViewTapped()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "TournamentTableHeader") as? TournamentTableHeader
        else {
            return UIView()
        }
        let tournamentId = sortedTournamentIds[section]
        if let tournament = eventsByTournament[tournamentId]?.first?.tournament {
            header.set(tournamentApiModel: tournament)
            return header
        } else {
            return UIView()
        }
    }
}

extension EventsViewController {
    
    @objc func eventViewTapped() {
        
        let eventDetailsViewController = EventDetailsViewController()
        navigationController?.pushViewController(eventDetailsViewController, animated: true)
    }
    
    @discardableResult
    func setEventsApiData(_ eventResponse: [EventResponse]) -> Self {
        
        eventResponse.forEach {
            if eventsByTournament[$0.tournament.id] == nil {
                eventsByTournament[$0.tournament.id] = [$0]
            } else {
                eventsByTournament[$0.tournament.id]?.append($0)
            }
        }
        let sortedKeys = eventsByTournament.keys.sorted()
        sortedTournamentIds = sortedKeys
        tableView.reloadData()
        return self
    }
}
