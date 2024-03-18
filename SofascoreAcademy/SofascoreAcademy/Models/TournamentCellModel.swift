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
    
    init(countryName: String, leagueName: String, leagueLogo: UIImage) {
        self.countryName = countryName
        self.leagueName = leagueName
        self.leagueLogo = leagueLogo
    }
}

extension TournamentCellModel {
    static let sampleData = TournamentCellModel(countryName: AppStrings.spain,
                                                leagueName: AppStrings.la_liga,
                                                leagueLogo: UIImage(named: "la_liga_logo") ?? UIImage())
    
}
