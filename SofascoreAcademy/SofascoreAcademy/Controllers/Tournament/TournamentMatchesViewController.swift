//
//  TournamentMatchesViewController.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 10.06.2024..
//

import Foundation
import SnapKit
import SofaAcademic
import UIKit

class TournamentMatchesViewController: UIViewController, BaseViewProtocol {
    private let tableView: UITableView = .init()
    private var matchesByRound: [Int:[EventResponse]] = [:]
    private var sortedMatchRounds: [Int] = []
    
    private var isLoadingNext = false
    private var isLoadingLast = false
    private var currentPageNext = 0
    private var currentPageLast = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
        setupConstraints()
        styleViews()
        Task {
            await loadInitialData()
        }
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
        tableView.register(EventTableCell.self, forCellReuseIdentifier: "EventTableCell")
        tableView.register(TableRoundHeader.self, forHeaderFooterViewReuseIdentifier: "TableRoundHeader")
        tableView.reloadData()
        tableView.separatorStyle = .none
    }
    
    func loadInitialData() async {
        do {
            let initialNextMatches = try await getTournamentMatchesApiData(for: currentPageNext, type: "next")
            DispatchQueue.main.async { [weak self] in
                self?.setTournamentMatchesApiData(initialNextMatches)
            }
        } catch {
            print("Failed to load initial data: \(error)")
        }
    }
    
    func loadMoreData(for type: String) async {
        if type == "next" && isLoadingNext || type == "last" && isLoadingLast { return }

        if type == "next" {
            isLoadingNext = true
            currentPageNext += 1
        } else {
            isLoadingLast = true
            currentPageLast += 1
        }

        do {
            let newMatches = try await getTournamentMatchesApiData(for: type == "next" ? currentPageNext : currentPageLast, type: type)
            DispatchQueue.main.async { [weak self] in
                self?.setTournamentMatchesApiData(newMatches)
            }
        } catch {
            print("Failed to load more data: \(error)")
        }

        if type == "next" {
            isLoadingNext = false
        } else {
            isLoadingLast = false
        }
    }
    
    func getTournamentMatchesApiData(for page: Int, type: String) async throws -> [EventResponse] {
        let apiUrlAddition = "tournament/\(UserDefaultsHelper.tournamentTappedId)/events/\(type)/\(page)"
        let result: [EventResponse] = try await ApiClient.getApiData(urlAddition: apiUrlAddition, requestMethod: "GET", responseType: [EventResponse].self)
        return result
    }
}

extension TournamentMatchesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sortedMatchRounds.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let round = sortedMatchRounds[section]
        return matchesByRound[round]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EventTableCell", for: indexPath) as? EventTableCell
        else {
            return UITableViewCell()
        }
        let round = sortedMatchRounds[indexPath.section]
        guard let match = matchesByRound[round]?[indexPath.row] else {
            return UITableViewCell()
        }
        cell.set(eventResponse: match)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let roundId = sortedMatchRounds[indexPath.section]
        guard let match = matchesByRound[roundId]?[indexPath.row] else { return }
        self.eventViewTapped(match.id)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "TableRoundHeader") as? TableRoundHeader
        else {
            return UIView()
        }
        let roundId = sortedMatchRounds[section]
        if let round = matchesByRound[roundId]?.first?.round {
            header.set(round)
            return header
        } else {
            return UIView()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height

        if offsetY > contentHeight - height {
            Task {
                await loadMoreData(for: "next")
            }
        }
        if offsetY < 0 {
            Task {
                await loadMoreData(for: "last")
            }
        }
    }
}

extension TournamentMatchesViewController {
    @discardableResult
    func setTournamentMatchesApiData(_ eventResponse: [EventResponse]) -> Self {
        eventResponse.forEach {
            if matchesByRound[$0.round] == nil {
                matchesByRound[$0.round] = [$0]
            } else {
                matchesByRound[$0.round]?.append($0)
            }
        }
        let sortedRounds = matchesByRound.keys.sorted()
        sortedMatchRounds = sortedRounds
        tableView.reloadData()
        return self
    }
    
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
}
