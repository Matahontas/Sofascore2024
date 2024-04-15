//
//  AnimationsHelper.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 14.04.2024..
//

import Foundation
import UIKit

enum AnimationsHelper {
    
    static func applyFadeTransition() -> CATransition {
        let animation: CATransition = CATransition()
        animation.duration = 0.3
        animation.type = .fade
        animation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        return animation
    }
}
