//
//  TeamDetailsTabView.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 10.06.2024..
//

import Foundation
import SnapKit
import SofaAcademic
import UIKit

class TeamDetailsTabView: BaseView {
    
    private let barItemsStackView: UIStackView = .init()
    private let detailsTabItemView: TournamentDetailsTabItemView = .init()
    private let matchesTabItemView: TournamentDetailsTabItemView = .init()
    private let standingsTabItemView: TournamentDetailsTabItemView = .init()
    private let squadTabItemView: TournamentDetailsTabItemView = .init()
    private let tabViewIndicator: UIView = .init()
    private var tabViewIndicatorLeadingConstraint: Constraint?
    weak var delegate: TeamTabItemDelegateProtocol?

    override func addViews() {
        addSubview(barItemsStackView)
        barItemsStackView.addArrangedSubview(detailsTabItemView)
        barItemsStackView.addArrangedSubview(matchesTabItemView)
        barItemsStackView.addArrangedSubview(standingsTabItemView)
        barItemsStackView.addArrangedSubview(squadTabItemView)
        addSubview(tabViewIndicator)
    }
    
    override func styleViews() {
        barItemsStackView.spacing = 0
        barItemsStackView.axis = .horizontal
        barItemsStackView.distribution = .fillProportionally
        
        tabViewIndicator.backgroundColor = .sofaWhite
        matchesTabItemView.tabLabel("Matches")
        standingsTabItemView.tabLabel("Standings")
        detailsTabItemView.tabLabel("Details")
        squadTabItemView.tabLabel("Squad")
    }
    
    override func setupConstraints() {
        
        barItemsStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(48)
        }
        let tabViewIndicatorWidth = (UIScreen.main.bounds.width / 4) - 16
        tabViewIndicator.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.height.equalTo(4)
            $0.width.equalTo(tabViewIndicatorWidth)
            tabViewIndicatorLeadingConstraint = $0.leading.equalToSuperview().offset(UserDefaultsHelper.teamDetailsTabIndex * (Int(UIScreen.main.bounds.width) / 4) + 8).constraint
        }
    }
    
    override func setupGestureRecognizers() {
        detailsTabItemView.tag = 0
        matchesTabItemView.tag = 1
        standingsTabItemView.tag = 2
        squadTabItemView.tag = 3
        let matchesTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleMatchesTap(_:)))
        let standingsTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleStandingsTap(_:)))
        let detailsTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleDetailsTap(_:)))
        let squadTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleSquadTap(_:)))
        matchesTabItemView.addGestureRecognizer(matchesTapGestureRecognizer)
        standingsTabItemView.addGestureRecognizer(standingsTapGestureRecognizer)
        detailsTabItemView.addGestureRecognizer(detailsTapGestureRecognizer)
        squadTabItemView.addGestureRecognizer(squadTapGestureRecognizer)
    }
}

extension TeamDetailsTabView {
    @objc private func handleMatchesTap(_ sender: UITapGestureRecognizer) {
        guard let teamDetailsTabIndex = sender.view?.tag else { return }
        delegate?.matchesTabViewTapped(didSelectTabAtIndex: teamDetailsTabIndex)
    }
    @objc private func handleStandingsTap(_ sender: UITapGestureRecognizer) {
        guard let teamDetailsTabIndex = sender.view?.tag else { return }
        delegate?.standingsTabViewTapped(didSelectTabAtIndex: teamDetailsTabIndex)
    }
    @objc private func handleDetailsTap(_ sender: UITapGestureRecognizer) {
        guard let teamDetailsTabIndex = sender.view?.tag else { return }
        delegate?.detailsTabViewTapped(didSelectTabAtIndex: teamDetailsTabIndex)
    }
    @objc private func handleSquadTap(_ sender: UITapGestureRecognizer) {
        guard let teamDetailsTabIndex = sender.view?.tag else { return }
        delegate?.squadTabViewTapped(didSelectTabAtIndex: teamDetailsTabIndex)
    }
    
    @discardableResult
    func updateTabViewIndicatorOffset(_ index: Int) -> Self {
        tabViewIndicatorLeadingConstraint?.update(offset: index * (Int(UIScreen.main.bounds.width) / 4) + 8)
        return self
    }
    
    @discardableResult
    func animateTabViewIndicator() -> Self {
        UIView.animate { [weak self] in
            self?.layoutIfNeeded()
            self?.tabViewIndicator.layer.add(AnimationsHelper.applyFadeTransition(), forKey: "tournamentTabViewIndicatorTransition")
        }
        return self
    }
}
