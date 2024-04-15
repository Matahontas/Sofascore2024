//
//  TabView.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 04.04.2024..
//

import Foundation
import SnapKit
import SofaAcademic
import UIKit

class TabView: BaseView {
    
    private let barItemsStackView: UIStackView = .init()
    private var tabItemViews: [TabItemView] = .init()
    private let tabViewIndicator: UIView = .init()
    private let tabItems = TabBarItemModel.sampleData
    private var tabViewIndicatorLeadingConstraint: Constraint?
    weak var delegate: TabItemDelegateProtocol?
    
    override func addViews() {
        addSubview(barItemsStackView)
        tabItems.forEach {
            let tabItemView = TabItemView()
            tabItemView.sportImage($0.tabItemIcon)
            tabItemView.sportLabel($0.tabItemName)
            tabItemViews.append(tabItemView)
            barItemsStackView.addArrangedSubview(tabItemView)
        }
        addSubview(tabViewIndicator)
    }
    
    override func styleViews() {
        barItemsStackView.spacing = 0
        barItemsStackView.axis = .horizontal
        barItemsStackView.distribution = .fillProportionally
        
        tabViewIndicator.backgroundColor = .sofaWhite
    }
    
    override func setupConstraints() {
        
        barItemsStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(48)
        }
        let tabViewIndicatorWidth = (UIScreen.main.bounds.width / CGFloat(tabItemViews.count)) - 16
        tabViewIndicator.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.height.equalTo(4)
            $0.width.equalTo(tabViewIndicatorWidth)
            tabViewIndicatorLeadingConstraint = $0.leading.equalToSuperview().offset(8).constraint
        }
    }
    
    override func setupGestureRecognizers() {
        for (index, tabItemView) in tabItemViews.enumerated() {
            tabItemView.tag = index
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
            tabItemView.addGestureRecognizer(tapGestureRecognizer)
        }
    }
}

extension TabView {
    
    @objc private func handleTap(_ sender: UITapGestureRecognizer) {
        
        delegate?.tabViewTapped(didSelectTabAtIndex: sender.view?.tag ?? 0)
    }
    
    @discardableResult
    func updateTabViewIndicatorOffset(_ index: Int) -> Self {
        tabViewIndicatorLeadingConstraint?.update(offset: index * (Int(UIScreen.main.bounds.width) / tabItemViews.count) + 8)
        return self
    }
    
    @discardableResult
    func animateTabViewIndicator() -> Self {
        UIView.animate(animations: {
            self.layoutIfNeeded()
        }) {_ in
            self.tabViewIndicator.layer.add(AnimationsHelper.applyFadeTransition(), forKey: "tabViewIndicatorTransition")
        }
        return self
    }
}
