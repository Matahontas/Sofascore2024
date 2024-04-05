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
    private let verticalLine: UIView = . init()
    private let tabItems = TabBarItemModel.sampleData
    private var verticalLineLeadingConstraint: Constraint?
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
        addSubview(verticalLine)
        
    }
    
    override func styleViews() {
        barItemsStackView.spacing = 0
        barItemsStackView.axis = .horizontal
        barItemsStackView.distribution = .fillProportionally
        
        verticalLine.backgroundColor = .sofaWhite
        
    }
    
    override func setupConstraints() {
        
        barItemsStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        let verticalLineWidth = (UIScreen.main.bounds.width / CGFloat(tabItemViews.count)) - 16
        let leadingOffset = UserDefaults.standard.integer(forKey: "tabIndex") * (Int(UIScreen.main.bounds.width) / tabItemViews.count) + 8
        verticalLine.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.height.equalTo(4)
            $0.width.equalTo(verticalLineWidth)
            verticalLineLeadingConstraint = $0.leading.equalToSuperview().offset(leadingOffset).constraint
        }
    }
    
    override func setupGestureRecognizers() {
        for (index, tabItemView) in tabItemViews.enumerated() {
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
            tabItemView.addGestureRecognizer(tapGestureRecognizer)
            tabItemView.tag = index
        }
    }
}

extension TabView {
    
    @objc private func handleTap(_ sender: UITapGestureRecognizer) {
        
        guard let tappedTabItemView = sender.view as? TabItemView else { return }
        UserDefaults.standard.set(tappedTabItemView.tag, forKey: "tabIndex")

        delegate?.tabView(self, didSelectTabAtIndex: UserDefaults.standard.integer(forKey: "tabIndex"))
        
        let newLeadingOffset = tappedTabItemView.frame.origin.x + 8
        verticalLineLeadingConstraint?.update(offset: newLeadingOffset)
        
        UIView.animate(animations: {
            self.layoutIfNeeded()
        }) {_ in
            
            let animation: CATransition = CATransition()
            animation.duration = 0.3
            animation.type = .fade
            animation.timingFunction = CAMediaTimingFunction(name: .easeOut)
            self.verticalLine.layer.add(animation, forKey: "verticalLineTransition")
        }
    }
}
