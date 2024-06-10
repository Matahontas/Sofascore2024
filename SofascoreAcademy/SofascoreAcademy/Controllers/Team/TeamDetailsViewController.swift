//
//  TeamDetailsViewController.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 09.06.2024..
//

import Foundation
import SnapKit
import SofaAcademic
import UIKit

class TeamDetailsViewController: UIViewController, BaseViewProtocol {
    
    private let safeAreaCoverView: SafeAreaCoverView = .init()
    private let teamDetailsHeaderView: TournamentDetailsHeaderView = .init()
    private let teamContainerView: BaseView = .init()
    private let teamDetailsTabView: TeamDetailsTabView = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        addViews()
        setupConstraints()
        styleViews()
    }
    
    func addViews() {
        view.addSubview(safeAreaCoverView)
        view.addSubview(teamDetailsHeaderView)
        view.addSubview(teamDetailsTabView)
        view.addSubview(teamContainerView)
    }
    
    func setupConstraints() {
        safeAreaCoverView.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(view.safeAreaLayoutGuide.snp.height)
        }
        teamDetailsHeaderView.snp.makeConstraints {
            $0.top.equalTo(safeAreaCoverView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(72)
        }
        teamDetailsTabView.snp.makeConstraints {
            $0.top.equalTo(teamDetailsHeaderView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
        teamContainerView.snp.makeConstraints {
            $0.top.equalTo(teamDetailsTabView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func styleViews() {
        teamDetailsTabView.delegate = self
        teamContainerView.backgroundColor = .sofaGrayBackground
        teamContainerView.layer.add(AnimationsHelper.applyFadeTransition(), forKey: "teamDetailsChildViewTransition")
    }
}

extension TeamDetailsViewController {
    func setTeamDetailsApiData(_ teamDetails: TeamDetailsResponse) {
        UserDefaultsHelper.teamTappedId = teamDetails.id
        
        teamDetailsHeaderView
            .tournamentLogo(.sofa_api_url_string + "team/" + "\(teamDetails.id)/" + "image", placeHolder: UIImage(systemName: "person.3.fill"))
            .tournamentLabel(teamDetails.name)
            .tournamentCountryLogo(.sofa_api_url_string + "team/" + "\(teamDetails.id)/" + "image", placeHolder: UIImage(systemName: "person.3.fill"))
            .tournamentCountryLabel(teamDetails.country.name)
        
        if UserDefaultsHelper.teamDetailsTabIndex == 0 {
            let teamInfoViewController: TeamInfoViewController = .init()
            addChildToMainContainer(teamInfoViewController)
        }
        if UserDefaultsHelper.teamDetailsTabIndex == 1 {
            let teamMatchesViewController: TeamMatchesViewController = .init()
            addChildToMainContainer(teamMatchesViewController)
        }
        if UserDefaultsHelper.teamDetailsTabIndex == 2 {
            let teamStandingsViewController: TeamStandingsViewController = .init()
            addChildToMainContainer(teamStandingsViewController)
        }
        if UserDefaultsHelper.teamDetailsTabIndex == 3 {
            let teamSquadViewController: TeamSquadViewController = .init()
            addChildToMainContainer(teamSquadViewController)
        }
    }
    
    func addChildToMainContainer(_ child: UIViewController) {
        remove()
        
        addChild(child)
        teamContainerView.addSubview(child.view)
        child.didMove(toParent: self)
        child.view.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func remove() {
        if let child = children.first {
            child.willMove(toParent: nil)
            child.view.removeFromSuperview()
            child.removeFromParent()
        }
    }
}

extension TeamDetailsViewController: TeamTabItemDelegateProtocol {
    func matchesTabViewTapped(didSelectTabAtIndex index: Int) {
        UserDefaultsHelper.teamDetailsTabIndex = index
        teamDetailsTabView.updateTabViewIndicatorOffset(index)
        teamDetailsTabView.animateTabViewIndicator()
        let teamMatchesViewController = TeamMatchesViewController()
        
        addChildToMainContainer(teamMatchesViewController)
    }
    
    func standingsTabViewTapped(didSelectTabAtIndex index: Int) {
        UserDefaultsHelper.teamDetailsTabIndex = index
        teamDetailsTabView.updateTabViewIndicatorOffset(index)
        teamDetailsTabView.animateTabViewIndicator()
        let teamStandingsViewController = TeamStandingsViewController()
        
        addChildToMainContainer(teamStandingsViewController)
    }
    
    func detailsTabViewTapped(didSelectTabAtIndex index: Int) {
        UserDefaultsHelper.teamDetailsTabIndex = index
        teamDetailsTabView.updateTabViewIndicatorOffset(index)
        teamDetailsTabView.animateTabViewIndicator()
        let teamInfoViewController = TeamInfoViewController()
        
        addChildToMainContainer(teamInfoViewController)
    }
    
    func squadTabViewTapped(didSelectTabAtIndex index: Int) {
        UserDefaultsHelper.teamDetailsTabIndex = index
        teamDetailsTabView.updateTabViewIndicatorOffset(index)
        teamDetailsTabView.animateTabViewIndicator()
        let teamSquadViewController = TeamSquadViewController()
        
        addChildToMainContainer(teamSquadViewController)
    }
}
