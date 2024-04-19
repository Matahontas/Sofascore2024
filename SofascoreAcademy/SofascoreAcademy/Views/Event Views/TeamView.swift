//
//  TeamView.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 22.03.2024..
//

import Foundation
import SnapKit
import SofaAcademic
import UIKit

class TeamView: BaseView {
    private let teamStackView: UIStackView = .init()
    private let teamImageView: UIImageView = .init()
    private let teamLabel: UILabel = .init()
    
    override func addViews() {
        addSubview(teamStackView)
        teamStackView.addArrangedSubview(teamImageView)
        teamStackView.addArrangedSubview(teamLabel)
    }
    
    override func styleViews() {
        teamStackView.spacing = 8
        teamStackView.axis = .horizontal
        
        teamLabel.font = .body
        
        teamLabel.numberOfLines = 1
    }
    
    override func setupConstraints() {
        teamStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        teamImageView.snp.makeConstraints {
            $0.size.equalTo(16)
        }
    }
}

extension TeamView {
    
    @discardableResult
    func teamImage(_ image: UIImage) -> Self {
        teamImageView.image = image
        return self
    }
    
    @discardableResult
    func teamLabel(_ label: String) -> Self {
        teamLabel.text = label
        return self
    }
    
    @discardableResult
    func teamLabelColor(_ color: UIColor) -> Self {
        teamLabel.textColor = color
        return self
    }
}
