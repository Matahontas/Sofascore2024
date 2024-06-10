//
//  EmptyEventsView.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 27.05.2024..
//

import Foundation
import SnapKit
import SofaAcademic
import UIKit

class EmptyEventsView: BaseView {
    private let viewLabel: UILabel = .init()
    
    override func addViews() {
        addSubview(viewLabel)
    }
    
    override func styleViews() {
        viewLabel.font = .body
        viewLabel.numberOfLines = 1
        viewLabel.text = "No events for today."
    }
    
    override func setupConstraints() {
        viewLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
