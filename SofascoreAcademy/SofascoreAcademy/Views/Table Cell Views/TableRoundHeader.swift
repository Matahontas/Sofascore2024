//
//  TableRoundHeader.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 10.06.2024..
//

import Foundation
import SnapKit
import SofaAcademic
import UIKit

class TableRoundHeader: UITableViewHeaderFooterView, BaseViewProtocol {
    private let roundHeaderView: RoundHeaderView = .init()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        addViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews() {
        addSubview(roundHeaderView)
    }
    
    func setupConstraints() {
        roundHeaderView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension TableRoundHeader {
    func set(_ round: Int) {
        roundHeaderView.roundLabel("Round \(round)")
    }
}
