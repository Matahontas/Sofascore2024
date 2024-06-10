//
//  PeriodIncidentView.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 08.06.2024..
//

import Foundation
import SnapKit
import SofaAcademic
import UIKit

class PeriodIncidentView: BaseView {
    private let periodContainerSubview: BaseView = .init()
    private let periodIncidentLabelView: UILabel = .init()
    
    override func addViews() {
        addSubview(periodContainerSubview)
        periodContainerSubview.addSubview(periodIncidentLabelView)
    }
    
    override func styleViews() {
        periodContainerSubview.backgroundColor = .sofaBeige
        periodContainerSubview.layer.cornerRadius = 16
        periodContainerSubview.layer.masksToBounds = true
        
        periodIncidentLabelView.font = .assistive
        periodIncidentLabelView.numberOfLines = 1
        periodIncidentLabelView.textAlignment = .center
        periodIncidentLabelView.textColor = .sofaRed
    }

    override func setupConstraints() {
        periodContainerSubview.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        periodIncidentLabelView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.lessThanOrEqualToSuperview()
        }
    }
}

extension PeriodIncidentView {
    @discardableResult
    func periodIncidentLabel(_ label: String) -> Self {
        periodIncidentLabelView.text = label
        return self
    }
}
