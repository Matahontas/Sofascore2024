//
//  TeamCellView.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 21.03.2024..
//

import Foundation
import SnapKit
import SofaAcademic
import UIKit

class TeamCellView: BaseView {
    let teamStackView: UIStackView = .init()
    let teamImageView: UIImageView = .init()
    let teamLabel: UILabel = .init()
    
    override func addViews() {
        addSubview(teamStackView)
        teamStackView.addArrangedSubview(teamImageView)
        teamStackView.addArrangedSubview(teamLabel)
    }
    
    override func styleViews() {
        teamStackView.spacing = 8
        
        teamLabel.font = .body
        
        teamLabel.numberOfLines = 1
    }
    
    override func setupConstraints() {
        teamStackView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        teamImageView.snp.makeConstraints {
            $0.size.equalTo(16)
        }
    }
}
