//
//  RoundHeaderView.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 10.06.2024..
//

import Foundation
import SnapKit
import SofaAcademic
import UIKit

class RoundHeaderView: BaseView {
    private let roundLabelView: UILabel = .init()

    override func addViews() {
        addSubview(roundLabelView)
    }
    
    override func styleViews() {
        backgroundColor = .sofaGrayBackground
        roundLabelView.font = .assistive
        roundLabelView.numberOfLines = 1
        roundLabelView.textColor = .sofaBlack
    }
    
    override func setupConstraints() {
        roundLabelView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(24)
            $0.leading.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(8)
            $0.trailing.lessThanOrEqualToSuperview()
        }
    }
}

extension RoundHeaderView {
    @discardableResult
    func roundLabel(_ label: String) -> Self {
        roundLabelView.text = label
        return self
    }
}
