//
//  TournamentHeaderModel.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 22.03.2024..
//

import Foundation
import UIKit

struct TournamentHeaderModel {
    
    var countryName: String
    var leagueName: String
    var leagueLogo: UIImage
}

extension TournamentHeaderModel {
    static let sampleData: [TournamentHeaderModel] =
    [
        TournamentHeaderModel(countryName: .spain,
                            leagueName: .la_liga,
                            leagueLogo: .laLigaLogo
                           ),
        TournamentHeaderModel(countryName: .germany,
                            leagueName: .bundesliga,
                            leagueLogo: .laLigaLogo
                           ),
        TournamentHeaderModel(countryName: .england,
                            leagueName: .premier_league,
                            leagueLogo: .laLigaLogo
                           ),
        TournamentHeaderModel(countryName: .italy,
                            leagueName: .serie_a,
                            leagueLogo: .laLigaLogo
                           ),
        TournamentHeaderModel(countryName: .france,
                            leagueName: .ligue_1,
                            leagueLogo: .laLigaLogo
                           )
    ]
}
