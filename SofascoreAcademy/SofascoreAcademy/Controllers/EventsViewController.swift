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
    
    private var tournaments = TournamentHeaderModel.sampleData
    private var events = [EventModel.sampleDataFootball, EventModel.sampleDataBasketball, EventModel.sampleDataAmFootball]
    private let tableView: UITableView = .init()
    private var dataIndex: Int = 0
        
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
        return tournaments.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        events[dataIndex][tournaments[section].countryName]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EventTableCell", for: indexPath) as? EventTableCell
        else {
            return UITableViewCell()
        }
        guard let event = events[dataIndex][tournaments[indexPath.section].countryName]?[indexPath.row] else { return UITableViewCell() }
        let eventTapGesture = UITapGestureRecognizer(target: self, action: #selector(eventViewTapped))
        
        cell.set(eventModel: event)
        
        cell.addGestureRecognizer(eventTapGesture)

        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "TournamentTableHeader") as? TournamentTableHeader
        else {
            return UIView()
        }
        let tournament = tournaments[section]
        
        header.set(tournamentHeaderModel: tournament)
        
        return header
    }
}

extension EventsViewController {
    
    @objc func eventViewTapped() {
        let eventDetailsViewController = EventDetailsViewController()
        navigationController?.pushViewController(eventDetailsViewController, animated: true)
    }
    
    @discardableResult
    func dataIndex(_ index: Int) -> Self {
        dataIndex = index
        return self
    }
}

#Preview {
    EventsViewController()
}
