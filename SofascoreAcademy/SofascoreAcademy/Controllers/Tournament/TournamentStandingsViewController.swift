//
//  TournamentStandingsViewController.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 10.06.2024..
//

import Foundation
import SnapKit
import SofaAcademic
import UIKit

class TournamentStandingsViewController: UIViewController, BaseViewProtocol {
    private let tableView: UITableView = .init()
    private var tournamentStandingsResponse: [TournamentStandingsResponse] = []

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
        tableView.register(AmFootballStandingsCell.self, forCellReuseIdentifier: "AmFootballStandingsCell")
        tableView.register(FootballStandingsCell.self, forCellReuseIdentifier: "FootballStandingsCell")
        tableView.register(BasketballStandingsCell.self, forCellReuseIdentifier: "BasketballStandingsCell")

        tableView.register(AmFootballStandingsHeader.self, forHeaderFooterViewReuseIdentifier: "AmFootballStandingsHeader")
        tableView.register(BasketballStandingsHeader.self, forHeaderFooterViewReuseIdentifier: "BasketballStandingsHeader")
        tableView.register(FootballStandingsHeader.self, forHeaderFooterViewReuseIdentifier: "FootballStandingsHeader")
        tableView.reloadData()
        tableView.separatorStyle = .none
    }
    
}

extension TournamentStandingsViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 48
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let tournamentStanding = tournamentStandingsResponse[section]
        if tournamentStanding.tournament.sport.slug == "football" {
            guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "FootballStandingsHeader") as? FootballStandingsHeader
            else {
                return UIView()
            }
            return header
        }
                
        if tournamentStanding.tournament.sport.slug == "basketball"  {
            guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "BasketballStandingsHeader") as? BasketballStandingsHeader
            else {
                return UIView()
            }
            return header
        }
        
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "AmFootballStandingsHeader") as? AmFootballStandingsHeader
        else {
            return UIView()
        }
        return header
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tournamentStandingsResponse[section].sortedStandingsRows.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 48
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tournamentStanding = tournamentStandingsResponse[indexPath.section]
        if tournamentStanding.tournament.sport.slug == "football" {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FootballStandingsCell", for: indexPath) as? FootballStandingsCell
            else {
                return UITableViewCell()
            }
            
            cell.set(tournamentStanding.sortedStandingsRows[indexPath.row], indexPath.row + 1)
            return cell
        }
        if tournamentStanding.tournament.sport.slug == "basketball" {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "BasketballStandingsCell", for: indexPath) as? BasketballStandingsCell
            else {
                return UITableViewCell()
            }
            cell.set(tournamentStanding.sortedStandingsRows[indexPath.row], indexPath.row + 1)
            return cell
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AmFootballStandingsCell", for: indexPath) as? AmFootballStandingsCell
        else {
            return UITableViewCell()
        }
        cell.set(tournamentStanding.sortedStandingsRows[indexPath.row], indexPath.row + 1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tournamentStanding = tournamentStandingsResponse[indexPath.section]
        let teamDetailsViewController = TeamDetailsViewController()
        navigationController?.pushViewController(teamDetailsViewController, animated: true)
    }
}

extension TournamentStandingsViewController {
    @discardableResult
    func appendTournamentStandings(_ tournamentStandings: [TournamentStandingsResponse]) -> Self {
        tournamentStandings.forEach {
            if $0.type == "total" {
                self.tournamentStandingsResponse.append($0)
            }
        }
        tableView.reloadData()
        return self
    }
    
    @objc func teamTapped(_ playerId: Int) {
        navigationController?.pushViewController(TeamDetailsViewController(), animated: true)
    }
}
