//
//  EmptyIncidentsView.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 09.06.2024..
//

import Foundation
import SnapKit
import SofaAcademic
import UIKit

class EmptyIncidentsView: BaseView {
    private let noResultsContainer: BaseView = .init()
    private let noResultsLabelView: UILabel = .init()
    private let viewTournamentDetailsButton: UIButton = .init()
    var viewTournamentDetailsButtonTapHandler: (() -> Void)? = nil
    
    override func addViews() {
        addSubview(noResultsContainer)
        noResultsContainer.addSubview(noResultsLabelView)
        addSubview(viewTournamentDetailsButton)
    }
    
    override func styleViews() {
        noResultsContainer.backgroundColor = .sofaNoResults
        noResultsContainer.layer.cornerRadius = 8
        noResultsContainer.layer.masksToBounds = true
        
        noResultsLabelView.font = .bodyParagraph
        noResultsLabelView.textColor = .sofaGray
        noResultsLabelView.textAlignment = .center
        noResultsLabelView.numberOfLines = 1
        noResultsLabelView.text = "No results yet."
        
        viewTournamentDetailsButton.setTitle("View Tournament Details", for: .normal)
        viewTournamentDetailsButton.setTitleColor(.primaryDefault, for: .normal)
        viewTournamentDetailsButton.titleLabel?.font = .action
        viewTournamentDetailsButton.layer.borderWidth = 2.0
        viewTournamentDetailsButton.layer.borderColor = UIColor.primaryDefault.cgColor
        viewTournamentDetailsButton.layer.cornerRadius = 2.0
    }
    
    override func setupConstraints() {
        noResultsContainer.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview().inset(8)
            $0.bottom.equalToSuperview().inset(88)
        }
        noResultsLabelView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        viewTournamentDetailsButton.snp.makeConstraints {
            $0.top.equalTo(noResultsContainer.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(74)
            $0.bottom.equalToSuperview().inset(32)
        }
    }
    
    override func setupBinding() {
        viewTournamentDetailsButton.addTarget(self, action: #selector(viewTournamentButtonAction), for: .touchUpInside)
    }
}

extension EmptyIncidentsView {
    @objc
    func viewTournamentButtonAction() {
        viewTournamentDetailsButtonTapHandler?()
    }
}
