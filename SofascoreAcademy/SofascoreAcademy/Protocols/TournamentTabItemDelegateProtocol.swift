//
//  TournamentTabItemDelegateProtocol.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 10.06.2024..
//

import Foundation

protocol TournamentTabItemDelegateProtocol: AnyObject {
    func matchesTabViewTapped(didSelectTabAtIndex index: Int)
    func standingsTabViewTapped(didSelectTabAtIndex index: Int)
}
