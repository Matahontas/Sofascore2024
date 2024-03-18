//
//  TournamentCellView.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 15.03.2024..
//

import Foundation
import UIKit
import SofaAcademic
import SnapKit

class TournamentCellView: BaseView {
    
    let logoImage: UIImageView = .init()
    let leagueLabelStack: UIStackView = .init()
    let countryLabel: UILabel = .init()
    let pointerRight: UIImageView = .init()
    let leagueLabel: UILabel = .init()
    
    override func addViews() {
        addSubview(logoImage)
        addSubview(leagueLabelStack)
        leagueLabelStack.addArrangedSubview(countryLabel)
        leagueLabelStack.addArrangedSubview(pointerRight)
        leagueLabelStack.addArrangedSubview(leagueLabel)
    }
    
    override func styleViews() {
        backgroundColor = .white
        
        leagueLabelStack.axis = .horizontal
        
        countryLabel.font = Fonts.headline3
        countryLabel.numberOfLines = 1
        
        pointerRight.image = UIImage(named: "ic_pointer_right")
        pointerRight.alpha = 0.4
        
        leagueLabel.font = Fonts.headline3
        leagueLabel.textColor = .sofaGray
        leagueLabel.numberOfLines = 1
    }
    
    override func setupConstraints() {
        logoImage.snp.makeConstraints {
            $0.height.width.equalTo(32)
            $0.top.equalToSuperview().inset(12)
            $0.leading.equalToSuperview().inset(16)
        }
        leagueLabelStack.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.leading.equalToSuperview().inset(80)
            $0.height.equalTo(24)
        }
        pointerRight.snp.makeConstraints {
            $0.width.equalTo(24)
        }
        leagueLabel.snp.makeConstraints {
            $0.width.equalTo(91)
        }
    }
    
//    override func setupBinding() {
//
//    }
}
