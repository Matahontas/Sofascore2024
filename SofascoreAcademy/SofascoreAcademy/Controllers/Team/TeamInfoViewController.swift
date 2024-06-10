//
//  TeamInfoViewController.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 10.06.2024..
//

import Foundation
import SnapKit
import SofaAcademic
import UIKit

class TeamInfoViewController: UIViewController, BaseViewProtocol {
    private let label: UILabel = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
        setupConstraints()
        styleViews()
    }
    
    func addViews() {
        view.addSubview(label)
    }
    
    func setupConstraints() {
        label.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    func styleViews() {
        label.text = "Team info"
    }
}

extension TeamInfoViewController {
    @discardableResult
    func label(_ label: String) -> Self {
        self.label.text = label
        return self
    }
}
