//
//  PeriodIncidentViewCell.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 08.06.2024..
//

import SnapKit
import UIKit

class PeriodIncidentViewCell: UITableViewCell {
    
    private let periodIncidentView: PeriodIncidentView = .init()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        createViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createViews() {
        addSubview(periodIncidentView)
        backgroundColor = .sofaWhite
        periodIncidentView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(8)
        }
    }
}

extension PeriodIncidentViewCell {
    func set(_ eventIncident: EventIncidentsResponse) {
        periodIncidentView.periodIncidentLabel(eventIncident.text ?? "")
    }
}
