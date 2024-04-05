//
//  TabItemView.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 02.04.2024..
//

import Foundation
import SnapKit
import SofaAcademic
import UIKit

class TabItemView: BaseView {

    private let sportImageView: UIImageView = .init()
    private let sportLabel: UILabel = .init()
    var tabItemViewTapHandler: ((Int) -> Void)? = nil
    
    override func addViews() {
        addSubview(sportImageView)
        addSubview(sportLabel)
    }
    
    override func styleViews() {
        
        backgroundColor = .primaryDefault
    
        sportImageView.tintColor = .sofaWhite
        
        sportLabel.font = .body
        sportLabel.numberOfLines = 1
        sportLabel.textAlignment = .center
        sportLabel.textColor = .sofaWhite
    }
    
    override func setupConstraints() {
        sportImageView.snp.makeConstraints {
            $0.size.equalTo(16)
            $0.top.equalToSuperview().inset(4)
            $0.centerX.equalToSuperview()
        }
        sportLabel.snp.makeConstraints {
            $0.top.equalTo(sportImageView.snp.bottom).offset(4)
            $0.centerX.equalToSuperview()
        }
    }
    
    override func setupGestureRecognizers() {
        let tabItemTapGesture = UITapGestureRecognizer(target: self, action: #selector(tabItemTappedAction))
        addGestureRecognizer(tabItemTapGesture)
    }
}

extension TabItemView {
    
    @discardableResult
    func sportImage(_ image: UIImage) -> Self {
        sportImageView.image = image
        return self
    }
    
    @discardableResult
    func sportLabel(_ label: String) -> Self {
        sportLabel.text = label
        return self
    }
    
    @objc
    func tabItemTappedAction() {
        tabItemViewTapHandler?(Int())
    }
}
