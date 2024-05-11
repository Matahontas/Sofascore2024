//
//  MainViewController.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 02.04.2024..
//

import Foundation
import SnapKit
import SofaAcademic
import UIKit

class MainViewController: UIViewController, BaseViewProtocol {
    
    private let safeAreaCoverView: SafeAreaCoverView = .init()
    private let mainHeaderView: MainHeaderView = .init()
    private let containerView: BaseView = .init()
    private let tabView: TabView = .init()
    private let calendarViewController: CalendarViewController = .init()
    private let calendarContainerView: BaseView = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
        setupConstraints()
        styleViews()
        setupGestureRecognizers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    
    func addViews() {
        view.addSubview(safeAreaCoverView)
        view.addSubview(mainHeaderView)
        view.addSubview(tabView)
        view.addSubview(calendarContainerView)
        addCalendar(calendarViewController)
        view.addSubview(containerView)
    }
    
    func setupConstraints() {
        safeAreaCoverView.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(view.safeAreaLayoutGuide.snp.height)
        }
        mainHeaderView.snp.makeConstraints {
            $0.top.equalTo(safeAreaCoverView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
        tabView.snp.makeConstraints {
            $0.top.equalTo(mainHeaderView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
        calendarContainerView.snp.makeConstraints {
            $0.top.equalTo(tabView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(48)
        }
        containerView.snp.makeConstraints {
            $0.top.equalTo(calendarContainerView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func styleViews() {
        tabView.delegate = self
        calendarViewController.delegate = self
        containerView.backgroundColor = .sofaWhite
        calendarContainerView.backgroundColor = .primaryDefaultDark
    }
    
    func setupGestureRecognizers() {
        mainHeaderView.settingsButtonTapHandler = { [weak self] in
            self?.showSettings()
        }
    }
}

extension MainViewController {
    
    func addEvent(_ child: UIViewController) {

        addChild(child)
        containerView.addSubview(child.view)
        child.didMove(toParent: self)
        child.view.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        containerView.layer.add(AnimationsHelper.applyFadeTransition(), forKey: "childViewTransition")
    }
    
    func addCalendar(_ child: UIViewController) {
        addChild(child)
        calendarContainerView.addSubview(child.view)
        child.didMove(toParent: self)
        child.view.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        calendarContainerView.layer.add(AnimationsHelper.applyFadeTransition(), forKey: "calendarViewTransition")
    }
    
    func remove(_ child: UIViewController) {
        guard child.parent != nil else {
            return
        }
        
        child.willMove(toParent: nil)
        child.view.removeFromSuperview()
        child.removeFromParent()
    }
    
    @objc func showSettings() {
        let settingsViewController = SettingsViewController()
        
        navigationController?.pushViewController(settingsViewController, animated: true)
    }
    
    func getEventsData(_ eventsViewController: EventsViewController) {
        
        let apiUrlAddition = "sport/" + "\(UserDefaultsHelper.selectedSportApiSlug)/" + "events/" + UserDefaultsHelper.selectedDateApiSlug
        Task {
            let event = try await ApiClient.getApiData(urlAddition: apiUrlAddition, requestMethod: "GET", responseType: [EventResponse].self)
            
            eventsViewController.setEventsApiData(event)
        }
    }
}

extension MainViewController: TabItemDelegateProtocol, CalendarItemDelegateProtocol {
    
    func tabViewTapped(didSelectTabAtIndex index: Int) {
        
        tabView.updateTabViewIndicatorOffset(index)
        tabView.animateTabViewIndicator()
        UserDefaultsHelper.tabBarIndex = index
        UserDefaultsHelper.selectedSportApiSlug = TabItemHelper.getSportSlugFromTabIndex(index)
    
        remove(self.children.first as? EventsViewController ?? UIViewController())

        let eventsViewController = EventsViewController()
        getEventsData(eventsViewController)
        addEvent(eventsViewController)
    }
    
    func calendarItemTapped() {
        
        calendarViewController.updateCurrentDateViewIndicatorPosition()
        calendarViewController.animateCurrentDateViewIndicator()
        
        remove(self.children.first as? EventsViewController ?? UIViewController())

        let eventsViewController = EventsViewController()
        getEventsData(eventsViewController)
        addEvent(eventsViewController)
    }
}
