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
    private let eventsViewController: EventsViewController = .init()
    private let containerView: BaseView = .init()
    private let tabView: TabView = .init()
    
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
        view.addSubview(containerView)
        add(eventsViewController)
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
        containerView.snp.makeConstraints {
            $0.top.equalTo(tabView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func styleViews() {
        tabView.delegate = self
    }
    
    func setupGestureRecognizers() {
        mainHeaderView.settingsButtonTapHandler = {
            self.showSettings()
        }
    }
}

extension MainViewController {
    
    func add(_ child: UIViewController) {
        addChild(child)
        containerView.addSubview(child.view)
        child.didMove(toParent: self)
        child.view.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        containerView.layer.add(AnimationsHelper.applyFadeTransition(), forKey: "childViewTransition")
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
}

extension MainViewController: TabItemDelegateProtocol {
    
    func tabViewTapped(didSelectTabAtIndex index: Int) {
        
        tabView.updateTabViewIndicatorOffset(index)
        tabView.animateTabViewIndicator()
        UserDefaultsHelper.tabBarIndex = index

        let eventsViewController = EventsViewController()
        eventsViewController.dataIndex(index)
        remove(self.children.first ?? UIViewController())
        containerView.addSubview(eventsViewController.view)
        
        add(eventsViewController)
    }
}
