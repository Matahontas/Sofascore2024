//
//  TournamentDetailsHeaderView.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 10.06.2024..
//

import Foundation
import SnapKit
import SofaAcademic
import UIKit

class TournamentDetailsHeaderView: BaseView {
    
    private let tournamentLogoContainer: BaseView = .init()
    private let tournamentLogoImageView: UIImageView = .init()
    private let tournamentLabelView: UILabel = .init()
    private let tournamentCountryStackView: UIStackView = .init()
    private let tournamentCountryImageView: UIImageView = .init()
    private let tournamentCountryLabelView: UILabel = .init()

    override func addViews() {
        addSubview(tournamentLogoContainer)
        tournamentLogoContainer.addSubview(tournamentLogoImageView)
        addSubview(tournamentLabelView)
        addSubview(tournamentCountryStackView)
        tournamentCountryStackView.addArrangedSubview(tournamentCountryImageView)
        tournamentCountryStackView.addArrangedSubview(tournamentCountryLabelView)
    }
    
    override func styleViews() {
        backgroundColor = .primaryDefault
        
        tournamentLogoContainer.backgroundColor = .sofaWhite
        tournamentLogoContainer.layer.cornerRadius = 8
        tournamentLogoContainer.layer.masksToBounds = true
        
        tournamentCountryStackView.axis = .horizontal
        tournamentCountryStackView.spacing = 4
        
        tournamentLabelView.font = .headline1
        tournamentLabelView.numberOfLines = 1
        tournamentLabelView.textColor = .sofaWhite
        
        tournamentCountryLabelView.font = .headline3
        tournamentCountryLabelView.numberOfLines = 1
        tournamentCountryLabelView.textColor = .sofaWhite
    }
    
    override func setupConstraints() {
        tournamentLogoContainer.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(16)
            $0.size.equalTo(56)
        }
        tournamentLogoImageView.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(8)
            $0.size.equalTo(40)
        }
        tournamentLabelView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(4)
            $0.leading.equalTo(tournamentLogoContainer.snp.trailing).offset(16)
            $0.trailing.lessThanOrEqualToSuperview()
        }
        tournamentCountryStackView.snp.makeConstraints {
            $0.top.equalTo(tournamentLabelView.snp.bottom).offset(4)
            $0.leading.equalTo(tournamentLogoContainer.snp.trailing).offset(16)
            $0.trailing.lessThanOrEqualToSuperview()
        }
        tournamentCountryImageView.snp.makeConstraints {
            $0.size.equalTo(16)
        }
    }
    
    override func setupBinding() {
    }
}

extension TournamentDetailsHeaderView {
    @discardableResult
    func tournamentLogo(_ URLString: String, placeHolder: UIImage?) -> Self {
        tournamentLogoImageView.imageFromServerURL(URLString, placeHolder: placeHolder)
        return self
    }
    
    @discardableResult
    func tournamentLabel(_ label: String) -> Self {
        tournamentLabelView.text = label
        return self
    }
    
    @discardableResult
    func tournamentCountryLogo(_ URLString: String, placeHolder: UIImage?) -> Self {
        tournamentCountryImageView.imageFromServerURL(URLString, placeHolder: placeHolder)
        return self
    }
    
    @discardableResult
    func tournamentCountryLabel(_ label: String) -> Self {
        tournamentCountryLabelView.text = label
        return self
    }
}
