//
//  TeamDetailsViewController.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 09.06.2024..
//

import Foundation
import SofaAcademic
import UIKit

class TeamDetailsViewController: UIViewController, BaseViewProtocol {
    
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
        title = "Team Details"
    }
}
