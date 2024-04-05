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

class MainViewController: UIViewController, BaseViewProtocol, TabItemDelegateProtocol {
    
    private let safeAreaCoverView: SafeAreaCoverView = .init()
    private let mainHeaderView: MainHeaderView = .init()
    private let eventsViewController: EventsViewController = .init()
    private let settingsViewController: SettingsViewController = .init()
    private let containerView: BaseView = .init()
    private let tabView: TabView = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabView.delegate = self
        
        addViews()
        setupConstraints()
        styleViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
        
        eventsViewController.dataIndex(UserDefaults.standard.integer(forKey: "tabIndex"))
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
            $0.height.equalTo(60)
        }
        mainHeaderView.snp.makeConstraints {
            $0.top.equalTo(safeAreaCoverView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(48)
        }
        tabView.snp.makeConstraints {
            $0.top.equalTo(mainHeaderView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(48)
        }
        containerView.snp.makeConstraints {
            $0.top.equalTo(tabView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func styleViews() {
        
        containerView.backgroundColor = .sofaRed

        mainHeaderView.settingButtonTapHandler = {
            self.showSettings()
        }
    }
    
    func tabView(_ tabView: TabView, didSelectTabAtIndex index: Int) {
        
        let eventsViewController = EventsViewController()
        eventsViewController.dataIndex(index)
        containerView.addSubview(eventsViewController.view)
        remove(self.children.first ?? UIViewController())
        
        add(eventsViewController)
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

#Preview {
    MainViewController()
}
