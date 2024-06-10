//
//  TournamentDetailsController.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 27.05.2024..
//

import Foundation
import SnapKit
import SofaAcademic
import UIKit

class TournamentDetailsViewController: UIViewController, BaseViewProtocol {
    private let tournamentDetailsHeaderView: TournamentDetailsHeaderView = .init()
    private let safeAreaCoverView: SafeAreaCoverView = .init()
    private let tournamentDetailsTabView: TournamentDetailsTabView = .init()
    private let tournamentDetailsMainContainer: BaseView = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
        setupConstraints()
        styleViews()
    }
    
    func addViews() {
        view.addSubview(safeAreaCoverView)
        view.addSubview(tournamentDetailsHeaderView)
        view.addSubview(tournamentDetailsTabView)
        view.addSubview(tournamentDetailsMainContainer)
    }
    
    func setupConstraints() {
        safeAreaCoverView.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(view.safeAreaLayoutGuide.snp.height)
        }
        tournamentDetailsHeaderView.snp.makeConstraints {
            $0.top.equalTo(safeAreaCoverView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(72)
        }
        tournamentDetailsTabView.snp.makeConstraints {
            $0.top.equalTo(tournamentDetailsHeaderView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
        tournamentDetailsMainContainer.snp.makeConstraints {
            $0.top.equalTo(tournamentDetailsTabView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func styleViews() {
        tournamentDetailsTabView.delegate = self
        tournamentDetailsMainContainer.backgroundColor = .sofaGrayBackground
        tournamentDetailsMainContainer.layer.add(AnimationsHelper.applyFadeTransition(), forKey: "tournamentDetailsChildViewTransition")
    }
}

extension TournamentDetailsViewController {
    func setTournamentDetailsApiData(_ tournamentDetails: Tournament) {
        UserDefaultsHelper.tournamentTappedId = tournamentDetails.id
        
        tournamentDetailsHeaderView
            .tournamentLogo(.sofa_api_url_string + "tournament/" + "\(tournamentDetails.id)/" + "image", placeHolder: UIImage(systemName: "person.3.fill"))
            .tournamentLabel(tournamentDetails.name)
            .tournamentCountryLogo(.sofa_api_url_string + "tournament/" + "\(tournamentDetails.id)/" + "image", placeHolder: UIImage(systemName: "person.3.fill"))
            .tournamentCountryLabel(tournamentDetails.country.name)
        
        if UserDefaultsHelper.tournamentDetailsTabIndex == 0 {
            let tournamentMatchesViewController: TournamentMatchesViewController = .init()
            addChildToMainContainer(tournamentMatchesViewController)
        }
        if UserDefaultsHelper.tournamentDetailsTabIndex == 1 {
            let tournamentStandingsViewController: TournamentStandingsViewController = .init()
            getTournamentStandings(tournamentStandingsViewController)
        }
    }
    
    func addChildToMainContainer(_ child: UIViewController) {
        remove()
        
        addChild(child)
        tournamentDetailsMainContainer.addSubview(child.view)
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
    
    func getTournamentStandings(_ tournamentStandingsViewController: TournamentStandingsViewController) {
        let apiUrlAddition = "tournament/\(UserDefaultsHelper.tournamentTappedId)/standings"

        Task {
            let tournamentStandings = try await ApiClient.getApiData(urlAddition: apiUrlAddition, requestMethod: "GET", responseType: [TournamentStandingsResponse].self)
            tournamentStandingsViewController.appendTournamentStandings(tournamentStandings)
            addChildToMainContainer(tournamentStandingsViewController)
        }
    }

}

extension TournamentDetailsViewController: TournamentTabItemDelegateProtocol {
    func matchesTabViewTapped(didSelectTabAtIndex index: Int) {
        UserDefaultsHelper.tournamentDetailsTabIndex = index
        tournamentDetailsTabView.updateTabViewIndicatorOffset(index)
        tournamentDetailsTabView.animateTabViewIndicator()
        
        let tournamentMatchesViewController: TournamentMatchesViewController = .init()
        addChildToMainContainer(tournamentMatchesViewController)
    }
    
    func standingsTabViewTapped(didSelectTabAtIndex index: Int) {
        UserDefaultsHelper.tournamentDetailsTabIndex = index
        tournamentDetailsTabView.updateTabViewIndicatorOffset(index)
        tournamentDetailsTabView.animateTabViewIndicator()

        let tournamentStandingsViewController = TournamentStandingsViewController()
        getTournamentStandings(tournamentStandingsViewController)
    }
}

