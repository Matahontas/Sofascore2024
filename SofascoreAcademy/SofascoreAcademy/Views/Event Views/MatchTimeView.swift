//
//  MatchTimeView.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 22.03.2024..
//

import Foundation
import SnapKit
import SofaAcademic
import UIKit

class MatchTimeView: BaseView {
    
    private let startTimeLabel: UILabel = .init()
    private let matchTimeLabel: UILabel = .init()
    private let dividerView: UIView = .init()
    
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
            $0.bottom.equalToSuperview().inset(30)
        }
        matchTimeLabel.snp.makeConstraints {
            $0.top.equalTo(startTimeLabel.snp.bottom).offset(4)
            $0.leading.trailing.equalToSuperview().inset(4)
            $0.bottom.equalToSuperview().inset(10)
        }
        dividerView.snp.makeConstraints {
            $0.width.equalTo(1)
            $0.top.bottom.equalToSuperview().inset(8)
            $0.trailing.equalToSuperview()
        }
    }
}

extension MatchTimeView {
    
    @discardableResult
    func startTime(_ time: String) -> Self {
        let dateFormatter = DateFormatter()
        let formattedTime: String
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let date = dateFormatter.date(from: time) {
            let hour = Calendar.current.component(.hour, from: date)
            let minute = Calendar.current.component(.minute, from: date)
            formattedTime = String(format: "%02d:%02d", hour, minute)
        } else {
            formattedTime = "-"
        }
        startTimeLabel.text = formattedTime
        return self
    }
    
    @discardableResult
    func matchTime(_ time: String) -> Self {
        let dateFormatter = DateFormatter()
        let formattedTime: String
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let date = dateFormatter.date(from: time) {
            let dateComponents = Calendar.current.dateComponents([.hour, .minute], from: date)
            let nowComponents = Calendar.current.dateComponents([.hour, .minute], from: Date())
            let minutesDifference = Calendar.current.dateComponents([.minute], from: dateComponents, to: nowComponents).minute ?? 0
            formattedTime = String(minutesDifference)
        } else {
            formattedTime = time
        }
        matchTimeLabel.text = formattedTime
        return self
    }
    
    @discardableResult
    func matchTimeColor(_ color: UIColor) -> Self {
        matchTimeLabel.textColor = color
        return self
    }
}
