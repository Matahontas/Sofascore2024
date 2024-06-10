//
//  TournamentDetailsTabItemView.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 10.06.2024..
//

import Foundation
import SnapKit
import SofaAcademic
import UIKit

class TournamentDetailsTabItemView: BaseView {
    private let tabLabelView: UILabel = .init()
    
    override func addViews() {
        addSubview(tabLabelView)
    }
    
    override func styleViews() {
        backgroundColor = .primaryDefault
        
        tabLabelView.font = .body
        tabLabelView.numberOfLines = 1
        tabLabelView.textAlignment = .center
        tabLabelView.textColor = .sofaWhite
    }
    
    override func setupConstraints() {
        tabLabelView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}

extension TournamentDetailsTabItemView {
    @discardableResult
    func tabLabel(_ label: String) -> Self {
        tabLabelView.text = label
        return self
    }
}

