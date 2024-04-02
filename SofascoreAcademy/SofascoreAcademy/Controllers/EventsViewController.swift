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
    
    var tournaments = TournamentHeaderModel.sampleData
    var events = EventModel.sampleData
    
    private let tableView: UITableView = .init()
    
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
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func styleViews() {
        view.safeAreaLayoutGuide.owningView?.backgroundColor = .safeArea
        
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
        events[tournaments[section].countryName]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EventTableCell", for: indexPath) as? EventTableCell
        else {
            return UITableViewCell()
        }
        let event = events[tournaments[indexPath.section].countryName]?[indexPath.row] ?? EventModel.emptyEventModel
        
        cell.set(eventModel: event)

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

#Preview {
    EventsViewController()
}
