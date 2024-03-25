//
//  TournamentHeaderView.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 22.03.2024..
//

import Foundation
import SnapKit
import SofaAcademic
import UIKit

class TournamentHeaderView: BaseView {
    
    private let logoImageView: UIImageView = .init()
    private let leagueLabelStack: UIStackView = .init()
    private let countryLabel: UILabel = .init()
    private let pointerRightImageView: UIImageView = .init()
    private let leagueLabel: UILabel = .init()
    
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
            $0.top.bottom.equalToSuperview().inset(12)
            $0.leading.equalToSuperview().inset(16)
        }
        leagueLabelStack.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.leading.equalTo(logoImageView.snp.trailing).offset(32)
            $0.bottom.equalToSuperview().inset(16)
            $0.trailing.lessThanOrEqualToSuperview()
        }
        pointerRightImageView.snp.makeConstraints {
            $0.size.equalTo(24)
        }
    }
}

extension TournamentHeaderView {
    
    @discardableResult
    func countryName(_ name: String) -> Self {
        countryLabel.text = name
        return self
    }
    
    @discardableResult
    func leagueName(_ name: String) -> Self {
        leagueLabel.text = name
        return self
    }
    
    @discardableResult
    func leagueLogo(_ image: UIImage) -> Self {
        logoImageView.image = image
        return self
    }
}
