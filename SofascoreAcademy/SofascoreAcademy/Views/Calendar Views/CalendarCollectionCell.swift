//
//  CalendarCollectionCell.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 05.05.2024..
//

import SnapKit
import UIKit

class CalendarCollectionCell: UICollectionViewCell {
    
    private let calendarItemView: CalendarItemView = .init()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        createViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createViews() {
        addSubview(calendarItemView)
        calendarItemView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension CalendarCollectionCell {
    
    func set(calendarDayLabel: String, calendarDateLabel: String) {
        calendarItemView
            .dayOfTheWeekLabel(calendarDayLabel)
            .dateLabel(calendarDateLabel)
    }
}
