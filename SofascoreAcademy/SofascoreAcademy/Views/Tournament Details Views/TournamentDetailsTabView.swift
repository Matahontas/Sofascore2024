//
//  TournamentDetailsTabView.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 10.06.2024..
//

import Foundation
import SnapKit
import SofaAcademic
import UIKit

class TournamentDetailsTabView: BaseView {
    
    private let barItemsStackView: UIStackView = .init()
    private let matchesTabItemView: TournamentDetailsTabItemView = .init()
    private let standingsTabItemView: TournamentDetailsTabItemView = .init()
    private let tabViewIndicator: UIView = .init()
    private var tabViewIndicatorLeadingConstraint: Constraint?
    weak var delegate: TournamentTabItemDelegateProtocol?
    
    override func addViews() {
        addSubview(barItemsStackView)
        barItemsStackView.addArrangedSubview(matchesTabItemView)
        barItemsStackView.addArrangedSubview(standingsTabItemView)
        addSubview(tabViewIndicator)
    }
    
    override func styleViews() {
        barItemsStackView.spacing = 0
        barItemsStackView.axis = .horizontal
        barItemsStackView.distribution = .fillProportionally
        
        tabViewIndicator.backgroundColor = .sofaWhite
        matchesTabItemView.tabLabel("Matches")
        standingsTabItemView.tabLabel("Standings")
    }
    
    override func setupConstraints() {
        
        barItemsStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(48)
        }
        let tabViewIndicatorWidth = (UIScreen.main.bounds.width / 2) - 16
        tabViewIndicator.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.height.equalTo(4)
            $0.width.equalTo(tabViewIndicatorWidth)
            tabViewIndicatorLeadingConstraint = $0.leading.equalToSuperview().offset(UserDefaultsHelper.tournamentDetailsTabIndex * (Int(UIScreen.main.bounds.width) / 2) + 8).constraint
        }
    }
    
    override func setupGestureRecognizers() {
        matchesTabItemView.tag = 0
        standingsTabItemView.tag = 1
        let matchesTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleMatchesTap(_:)))
        let standingsTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleStandingsTap(_:)))
        matchesTabItemView.addGestureRecognizer(matchesTapGestureRecognizer)
        standingsTabItemView.addGestureRecognizer(standingsTapGestureRecognizer)
    }
}

extension TournamentDetailsTabView {
    @objc private func handleMatchesTap(_ sender: UITapGestureRecognizer) {
        guard let tournamentDetailsTabIndex = sender.view?.tag else { return }
        delegate?.matchesTabViewTapped(didSelectTabAtIndex: tournamentDetailsTabIndex)
    }
    @objc private func handleStandingsTap(_ sender: UITapGestureRecognizer) {
        guard let tournamentDetailsTabIndex = sender.view?.tag else { return }
        delegate?.standingsTabViewTapped(didSelectTabAtIndex: tournamentDetailsTabIndex)
    }
    
    @discardableResult
    func updateTabViewIndicatorOffset(_ index: Int) -> Self {
        tabViewIndicatorLeadingConstraint?.update(offset: index * (Int(UIScreen.main.bounds.width) / 2) + 8)
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
