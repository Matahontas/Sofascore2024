//
//  CalendarItemView.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 04.05.2024..
//

import Foundation
import SnapKit
import SofaAcademic
import UIKit

class CalendarItemView: BaseView {

    private let dayOfTheWeekLabel: UILabel = .init()
    private let dateLabel: UILabel = .init()
    
    override func addViews() {
        addSubview(dayOfTheWeekLabel)
        addSubview(dateLabel)
    }
    
    override func styleViews() {
        
        backgroundColor = .primaryDefaultDark
        
        dayOfTheWeekLabel.font = .micro
        dayOfTheWeekLabel.numberOfLines = 1
        dayOfTheWeekLabel.textAlignment = .center
        dayOfTheWeekLabel.textColor = .sofaWhite
        
        dateLabel.font = .micro
        dateLabel.numberOfLines = 1
        dateLabel.textAlignment = .center
        dateLabel.textColor = .sofaWhite
    }
    
    override func setupConstraints() {
        dayOfTheWeekLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(8)
            $0.centerX.equalToSuperview()
        }
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(dayOfTheWeekLabel.snp.bottom).offset(2)
            $0.centerX.equalToSuperview()
        }
    }
}

extension CalendarItemView {
    
    @discardableResult
    func dayOfTheWeekLabel(_ label: String) -> Self {
        dayOfTheWeekLabel.text = label
        return self
    }
    
    @discardableResult
    func dateLabel(_ label: String) -> Self {
        dateLabel.text = label
        return self
    }
}
