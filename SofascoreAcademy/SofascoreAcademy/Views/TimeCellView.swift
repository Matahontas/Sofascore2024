//
//  TimeCellView.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 21.03.2024..
//

import Foundation
import SnapKit
import SofaAcademic
import UIKit

class TimeCellView: BaseView {
    
    let startTimeLabel: UILabel = .init()
    let matchTimeLabel: UILabel = .init()
    let dividerView: UIView = .init()
    
    override func addViews() {
        addSubview(startTimeLabel)
        addSubview(matchTimeLabel)
        addSubview(dividerView)
    }
    
    override func styleViews() {
        startTimeLabel.font = .tabular
        matchTimeLabel.font = .tabular
        
        startTimeLabel.numberOfLines = 1
        matchTimeLabel.numberOfLines = 1
        
        startTimeLabel.textAlignment = .center
        matchTimeLabel.textAlignment = .center
        
        startTimeLabel.textColor = .sofaGray
        matchTimeLabel.textColor = .sofaGray
        
        dividerView.backgroundColor = .sofaGray
    }
    
    override func setupConstraints() {
        startTimeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(4)
            $0.trailing.equalToSuperview().inset(4)
        }
        matchTimeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(30)
            $0.leading.equalToSuperview().inset(4)
            $0.trailing.equalToSuperview().inset(4)
        }
        dividerView.snp.makeConstraints {
            $0.width.equalTo(1)
            $0.top.bottom.equalToSuperview().inset(8)
            $0.trailing.equalToSuperview()
        }
    }
}
