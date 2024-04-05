//
//  MainHeaderView.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 02.04.2024..
//

import Foundation
import SnapKit
import SofaAcademic
import UIKit

class MainHeaderView: BaseView {
    
    private let sofascoreLockupImageView: UIImageView = .init()
    private let trophyIconButton: UIButton = .init()
    private let settingsIconButton: UIButton = .init()
    var settingButtonTapHandler: (() -> Void)? = nil
    
    override func addViews() {
        addSubview(sofascoreLockupImageView)
        addSubview(trophyIconButton)
        addSubview(settingsIconButton)
    }
    
    override func styleViews() {
        backgroundColor = .primaryDefault
        
        sofascoreLockupImageView.image = .sofascoreLockup
        sofascoreLockupImageView.tintColor = .white
        
        trophyIconButton.setImage(.iconTrophy, for: .normal)
        trophyIconButton.tintColor = .white
        
        settingsIconButton.setImage(.icSettings, for: .normal)
        settingsIconButton.tintColor = .white
    }
    
    override func setupConstraints() {
        sofascoreLockupImageView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(14)
            $0.leading.equalToSuperview().inset(16)
            $0.width.equalTo(132)
        }
        settingsIconButton.snp.makeConstraints {
            $0.size.equalTo(24)
            $0.top.bottom.equalToSuperview().inset(12)
            $0.trailing.equalToSuperview().inset(16)
        }
        trophyIconButton.snp.makeConstraints {
            $0.size.equalTo(24)
            $0.top.bottom.equalToSuperview().inset(12)
            $0.trailing.equalTo(settingsIconButton.snp.leading).inset(-24)
        }
    }
    
    override func setupBinding() {
        settingsIconButton.addTarget(self, action: #selector(settingsButtonAction), for: .touchUpInside)
    }
}

extension MainHeaderView {
    
    @objc
    func settingsButtonAction() {
        settingButtonTapHandler?()
    }
}
