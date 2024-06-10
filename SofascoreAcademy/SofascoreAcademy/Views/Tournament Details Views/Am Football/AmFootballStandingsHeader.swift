//
//  AmFootballStandingsHeader.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 10.06.2024..
//

import Foundation
import SnapKit
import SofaAcademic
import UIKit

class AmFootballStandingsHeader: UITableViewHeaderFooterView, BaseViewProtocol {
    
    private let amFootballStandingsHeaderView: AmFootballStandingsHeaderView = .init()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        addViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews() {
        addSubview(amFootballStandingsHeaderView)
    }
    
    func setupConstraints() {
        amFootballStandingsHeaderView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
