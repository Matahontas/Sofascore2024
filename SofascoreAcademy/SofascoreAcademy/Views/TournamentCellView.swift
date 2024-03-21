//
//  TournamentCellView.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 15.03.2024..
//

import Foundation
import SnapKit
import SofaAcademic
import UIKit

class TournamentCellView: BaseView {
    
    let logoImageView: UIImageView = .init()
    let leagueLabelStack: UIStackView = .init()
    let countryLabel: UILabel = .init()
    let pointerRightImageView: UIImageView = .init()
    let leagueLabel: UILabel = .init()
    
    override func addViews() {
        addSubview(logoImageView)
        addSubview(leagueLabelStack)
        leagueLabelStack.addArrangedSubview(countryLabel)
        leagueLabelStack.addArrangedSubview(pointerRightImageView)
        leagueLabelStack.addArrangedSubview(leagueLabel)
    }
    
    override func styleViews() {
        backgroundColor = .white
        
        leagueLabelStack.axis = .horizontal
        
        countryLabel.font = .headline3
        countryLabel.numberOfLines = 1
        
        pointerRightImageView.image = .icPointerRight
        pointerRightImageView.alpha = 0.4
        
        leagueLabel.font = .headline3
        leagueLabel.textColor = .sofaGray
        leagueLabel.numberOfLines = 1
    }
    
    override func setupConstraints() {
        logoImageView.snp.makeConstraints {
            $0.size.equalTo(32)
            $0.top.equalToSuperview().inset(12)
            $0.leading.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(12)
        }
        leagueLabelStack.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.leading.equalTo(logoImageView.snp.trailing).offset(32)
            $0.bottom.equalToSuperview().inset(16)
        }
        pointerRightImageView.snp.makeConstraints {
            $0.width.equalTo(24)
        }
    }
}
