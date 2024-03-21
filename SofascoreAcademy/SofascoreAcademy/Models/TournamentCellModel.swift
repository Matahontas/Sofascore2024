//
//  TournamentCellModel.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 15.03.2024..
//

import Foundation
import UIKit

struct TournamentCellModel {
    
    var countryName: String
    var leagueName: String
    var leagueLogo: UIImage
}

extension TournamentCellModel {
    static let sampleData = TournamentCellModel(countryName: .spain,
                                                leagueName: .la_liga,
                                                leagueLogo: .laLigaLogo
    )
}
