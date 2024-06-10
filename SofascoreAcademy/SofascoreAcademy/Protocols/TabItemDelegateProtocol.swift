//
//  TabItemDelegate.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 04.04.2024..
//

import Foundation

protocol TabItemDelegateProtocol: AnyObject {
    func tabViewTapped(didSelectTabAtIndex index: Int)
}
