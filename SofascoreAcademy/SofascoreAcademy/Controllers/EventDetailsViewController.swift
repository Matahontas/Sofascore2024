//
//  EventDetailsViewController.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 02.04.2024..
//

import Foundation
import SofaAcademic
import UIKit

class EventDetailsViewController: UIViewController, BaseViewProtocol {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .safeArea
        
        addViews()
        setupConstraints()
        styleViews()
    }
    
    func addViews() {
    }
    
    func setupConstraints() {
    }
    
    func styleViews() {
        title = .event_details_title
    }
}
