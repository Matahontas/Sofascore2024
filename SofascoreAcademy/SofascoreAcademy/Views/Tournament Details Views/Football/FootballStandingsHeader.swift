//
//  FootballStandingsHeader.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 10.06.2024..
//

import Foundation
import SnapKit
import SofaAcademic
import UIKit

class FootballStandingsHeader: UITableViewHeaderFooterView, BaseViewProtocol {
    
    private let footballStandingsHeaderView: FootballStandingsHeaderView = .init()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        addViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews() {
        addSubview(footballStandingsHeaderView)
    }
    
    func setupConstraints() {
        footballStandingsHeaderView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
