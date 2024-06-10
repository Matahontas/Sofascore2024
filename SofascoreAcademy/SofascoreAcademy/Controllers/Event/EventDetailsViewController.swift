//
//  EventDetailsViewController.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 02.04.2024..
//

import Foundation
import SnapKit
import SofaAcademic
import UIKit

class EventDetailsViewController: UIViewController, BaseViewProtocol {
    private let safeAreaCoverView: SafeAreaCoverView = .init()
    private let mainEventDetailsContainerView: BaseView = .init()
    private let eventDetailsMainView: EventDetailsMainView = .init()
    private let navigationStackView: UIStackView = .init()
    private let navigationLogoView: UIImageView = .init()
    private let navigationLabelView: UILabel = .init()
    
    private let eventIncidentsViewController: EventIncidentsViewController = .init()
    private let emptyIncidentsContainer: BaseView = .init()
    private let emptyIncidentsView: EmptyIncidentsView = .init()
    
    private let tournamentDetailsViewController: TournamentDetailsViewController = .init()
    private let teamDetailsViewController: TeamDetailsViewController = .init()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
        setupConstraints()
        styleViews()
        setupGestureRecognizers()
    }
    
    func addViews() {
        view.addSubview(safeAreaCoverView)
        view.addSubview(mainEventDetailsContainerView)
        
        mainEventDetailsContainerView.addSubview(eventDetailsMainView)
        navigationStackView.addArrangedSubview(navigationLogoView)
        navigationStackView.addArrangedSubview(navigationLabelView)
        
        addChild(eventIncidentsViewController)
        view.addSubview(eventIncidentsViewController.view)
        eventIncidentsViewController.didMove(toParent: self)
        
        view.addSubview(emptyIncidentsContainer)
        emptyIncidentsContainer.addSubview(emptyIncidentsView)
    }
    
    func setupConstraints() {
        safeAreaCoverView.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(view.safeAreaLayoutGuide.snp.height)
        }
        mainEventDetailsContainerView.snp.makeConstraints {
            $0.top.equalTo(safeAreaCoverView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(112)
        }
        eventDetailsMainView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        navigationLogoView.snp.makeConstraints {
            $0.size.equalTo(16)
        }
        
        eventIncidentsViewController.view.snp.makeConstraints {
            $0.top.equalTo(mainEventDetailsContainerView.snp.bottom).offset(8)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        emptyIncidentsContainer.snp.makeConstraints {
            $0.top.equalTo(mainEventDetailsContainerView.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(148)
        }
        emptyIncidentsView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        emptyIncidentsContainer.isHidden = true
    }
    
    func styleViews() {
        navigationItem.titleView = navigationStackView
        
        eventDetailsMainView.delegate = self
        
        safeAreaCoverView.backgroundColor = .sofaWhite
        view.backgroundColor = .sofaGrayBackground
        mainEventDetailsContainerView.backgroundColor = .sofaWhite
        
        navigationStackView.axis = .horizontal
        navigationStackView.spacing = 8
        navigationLabelView.font = .micro
        navigationLabelView.textColor = .sofaGray
        navigationLabelView.numberOfLines = 1
        
        eventIncidentsViewController.view.layer.add(AnimationsHelper.applyFadeTransition(), forKey: "eventIncidentsTransition")
        
        emptyIncidentsContainer.backgroundColor = .sofaWhite
    }
    
    func setupGestureRecognizers() {
        let navigationTapGesture = UITapGestureRecognizer(target: self, action: #selector(navigationTapped(_:)))
        navigationStackView.addGestureRecognizer(navigationTapGesture)
        emptyIncidentsView.viewTournamentDetailsButtonTapHandler = { [weak self] in
            self?.showTournamentDetails()
        }
    }
}

extension EventDetailsViewController {
    func setEventDetailsApiData(event: EventResponse, eventIncidents: [EventIncidentsResponse]) {
        eventDetailsMainView.updateViewBasedOn(event.status == "notstarted" ? true : false)
        eventDetailsMainView
            .homeTeamImage(.sofa_api_url_string + "team/" + "\(event.homeTeam.id)/" + "image", placeHolder: UIImage(systemName: "person.3.fill"))
            .homeTeamLabel(event.homeTeam.name)
            .awayTeamImage(.sofa_api_url_string + "team/" + "\(event.awayTeam.id)/" + "image", placeHolder: UIImage(systemName: "person.3.fill"))
            .awayTeamLabel(event.awayTeam.name)
            .homeScoreLabel(event.homeScore.total ?? -1)
            .awayScoreLabel(event.awayScore.total ?? -1)
            .upcomingDateLabel(event.startDate)
            .upcomingTimeLabel(event.startDate)
            .setHomeTeamTag(event.homeTeam.id)
            .setAwayTeamTag(event.awayTeam.id)
        
        navigationLogoView.imageFromServerURL(.sofa_api_url_string + "tournament/" + "\(event.tournament.id)/" + "image", placeHolder: UIImage(systemName: "person.3.fill"))
        navigationLabelView.text = "\(event.tournament.sport.name), \(event.tournament.country.name), \(event.tournament.name), Round \(event.round)"
        navigationStackView.tag = event.tournament.id
        tournamentDetailsViewController.view.tag = event.tournament.id

        if event.status == "inprogress" {
            eventDetailsMainView
                .eventTimeLabel(event.startDate)
                .homeScoreColor(.sofaRed)
                .awayScoreColor(.sofaRed)
                .eventTimeLabelColor(.sofaRed)
                .scoreDividerColor(.sofaRed)
        }
        if event.status == "finished" {
            eventDetailsMainView
                .eventTimeLabel("Full Time")
                .eventTimeLabelColor(.sofaGray)
                .homeScoreColor(event.winnerCode == "home" ? .sofaBlack : .sofaGray)
                .awayScoreColor(event.winnerCode == "away" ? .sofaBlack : .sofaGray)
                .scoreDividerColor(.sofaGray)
        }
        eventIncidentsViewController.appendEventIncidents(eventIncidents)
        
        if eventIncidents.count == 0 {
            eventIncidentsViewController.view.isHidden = true
            emptyIncidentsContainer.isHidden = false
            
        } else {
            eventIncidentsViewController.view.isHidden = false
            emptyIncidentsContainer.isHidden = true
        }
    }
    
    @objc func navigationTapped(_ sender: UITapGestureRecognizer) {
        guard let tournamentId = sender.view?.tag else { return }
        let apiUrlAddition = "tournament/\(tournamentId)"
        Task {
            let tournamentDetails = try await ApiClient.getApiData(urlAddition: apiUrlAddition, requestMethod: "GET", responseType: Tournament.self)
            tournamentDetailsViewController.setTournamentDetailsApiData(tournamentDetails)
        }
        navigationController?.pushViewController(tournamentDetailsViewController, animated: true)
    }
    
    @objc func showTournamentDetails() {
        let apiUrlAddition = "tournament/\(tournamentDetailsViewController.view.tag)"
        Task {
            let tournamentDetails = try await ApiClient.getApiData(urlAddition: apiUrlAddition, requestMethod: "GET", responseType: Tournament.self)
            tournamentDetailsViewController.setTournamentDetailsApiData(tournamentDetails)
        }
        navigationController?.pushViewController(tournamentDetailsViewController, animated: true)
    }
}

extension EventDetailsViewController: TeamDetailsDelegateProtocol {
    func teamTapped(teamTappedIndex index: Int) {
        navigationController?.pushViewController(teamDetailsViewController, animated: true)
    }
}
