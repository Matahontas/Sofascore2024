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
    private let tournamentDetailsViewController = TournamentDetailsViewController()
    
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
        let tournamentId = sortedTournamentIds[indexPath.section]
        guard let event = eventsByTournament[tournamentId]?[indexPath.row] else { return }
        
        self.eventViewTapped(event.id)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "TournamentTableHeader") as? TournamentTableHeader
        else {
            return UIView()
        }
        let tournamentId = sortedTournamentIds[section]
        if let tournament = eventsByTournament[tournamentId]?.first?.tournament {
            header.set(tournamentApiModel: tournament)
            
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(headerTapped(_:)))
            header.addGestureRecognizer(tapGesture)
            header.tag = section
            return header
        } else {
            return UIView()
        }
    }
}

extension EventsViewController {
    
    @objc func eventViewTapped(_ eventId: Int) {
        let eventDetailsViewController = EventDetailsViewController()
            
        let apiUrlAddition = "event/" + "\(eventId)"
        let apiUrlAdditionIncident = "event/" + "\(eventId)/incidents"

        Task {
            let event = try await ApiClient.getApiData(urlAddition: apiUrlAddition, requestMethod: "GET", responseType: EventResponse.self)
            
            let eventIncidents = try await ApiClient.getApiData(urlAddition: apiUrlAdditionIncident, requestMethod: "GET", responseType: [EventIncidentsResponse].self)
            
            eventDetailsViewController.setEventDetailsApiData(event: event, eventIncidents: eventIncidents)
        }
        navigationController?.pushViewController(eventDetailsViewController, animated: true)
    }
    
    @objc func headerTapped(_ sender: UITapGestureRecognizer) {
        guard let section = sender.view?.tag else { return }
        handleHeaderTap(section: section)
    }
    
    func handleHeaderTap(section: Int) {
        let tournamentId = sortedTournamentIds[section]
        let apiUrlAddition = "tournament/\(tournamentId)"
        Task {
            let tournamentDetails = try await ApiClient.getApiData(urlAddition: apiUrlAddition, requestMethod: "GET", responseType: Tournament.self)
            tournamentDetailsViewController.setTournamentDetailsApiData(tournamentDetails)
        }
        navigationController?.pushViewController(tournamentDetailsViewController, animated: true)
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
