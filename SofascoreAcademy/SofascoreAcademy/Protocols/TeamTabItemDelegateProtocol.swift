//
//  TeamTabItemDelegateProtocol.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 10.06.2024..
//

import Foundation

import Foundation

protocol TeamTabItemDelegateProtocol: AnyObject {
    func matchesTabViewTapped(didSelectTabAtIndex index: Int)
    func standingsTabViewTapped(didSelectTabAtIndex index: Int)
    func detailsTabViewTapped(didSelectTabAtIndex index: Int)
    func squadTabViewTapped(didSelectTabAtIndex index: Int)
}
