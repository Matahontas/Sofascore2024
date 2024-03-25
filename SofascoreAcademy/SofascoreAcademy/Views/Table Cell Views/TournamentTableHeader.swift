//
//  TournamentTableHeader.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 21.03.2024..
//

import Foundation
import SnapKit
import UIKit

class TournamentTableHeader: UITableViewHeaderFooterView {
    
    private let tournamentHeaderView: TournamentHeaderView = .init()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        createViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createViews() {
        addSubview(tournamentHeaderView)
        tournamentHeaderView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension TournamentTableHeader {
    
    func set(countryName: String, leagueName: String, leagueLogo: UIImage) {
        tournamentHeaderView.countryName(countryName)
        tournamentHeaderView.leagueName(leagueName)
        tournamentHeaderView.leagueLogo(leagueLogo)
    }
}
