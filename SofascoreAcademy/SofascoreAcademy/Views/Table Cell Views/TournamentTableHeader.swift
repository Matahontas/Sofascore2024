//
//  TournamentTableHeader.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 21.03.2024..
//

import Foundation
import SnapKit
import SofaAcademic
import UIKit

class TournamentTableHeader: UITableViewHeaderFooterView, BaseViewProtocol {
    
    private let tournamentHeaderView: TournamentHeaderView = .init()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        addViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews() {
        addSubview(tournamentHeaderView)
    }
    
    func setupConstraints() {
        tournamentHeaderView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension TournamentTableHeader {
    func set(tournamentApiModel: Tournament) {
        tournamentHeaderView.countryName(tournamentApiModel.country.name)
            .leagueName(tournamentApiModel.name)
            .leagueLogo(.sofa_api_url_string + "tournament/" + "\(tournamentApiModel.id)/" + "image", placeHolder: UIImage(systemName: "person.3.fill"))
    }
}
