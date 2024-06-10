//
//  LeaguesViewController.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 09.06.2024..
//

import Foundation
import SofaAcademic
import UIKit

class LeaguesViewController: UIViewController, BaseViewProtocol {
    
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
        title = "Leagues"
        view.backgroundColor = .systemBackground
        
        navigationItem.setLeftBarButton(
            UIBarButtonItem(title: .dismiss_string,
                            style: .done,target: self,
                            action: #selector(dismissLeaguesView)),
            animated: true)
    }
}

extension LeaguesViewController {
    
    @objc func dismissLeaguesView() {
        navigationController?.popViewController(animated: true)
    }
}
