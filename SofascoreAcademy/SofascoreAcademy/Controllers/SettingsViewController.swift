//
//  SettingsViewController.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 03.04.2024..
//

import Foundation
import SofaAcademic
import UIKit

class SettingsViewController: UIViewController, BaseViewProtocol {
    
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
        title = .settings_title
        view.backgroundColor = .systemBackground
        
        navigationItem.setLeftBarButton(
            UIBarButtonItem(title: .dismiss_string,
                            style: .done,target: self,
                            action: #selector(dismissSettingsView)),
            animated: true)
    }
}

extension SettingsViewController {
    
    @objc func dismissSettingsView() {
        
        navigationController?.popViewController(animated: true)
    }
}
