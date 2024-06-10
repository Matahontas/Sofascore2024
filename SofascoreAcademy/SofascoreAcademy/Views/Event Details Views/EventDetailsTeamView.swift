//
//  EventDetailsTeamView.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 07.06.2024..
//

import Foundation
import SnapKit
import SofaAcademic
import UIKit

class EventDetailsTeamView: BaseView {
    private let labelContainerView: BaseView = .init()
    private let teamImageView: UIImageView = .init()
    private let teamLabelView: UILabel = .init()
    
    override func addViews() {
        addSubview(labelContainerView)
        addSubview(teamImageView)
        labelContainerView.addSubview(teamLabelView)
    }
    
    override func styleViews() {
        
        teamLabelView.font = .assistive
        teamLabelView.numberOfLines = 2
        teamLabelView.textColor = .sofaBlack
        teamLabelView.textAlignment = .center
    }
    
    override func setupConstraints() {
        teamImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.size.equalTo(40)
        }
        labelContainerView.snp.makeConstraints {
            $0.top.equalTo(teamImageView.snp.bottom).offset(8)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        teamLabelView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.lessThanOrEqualToSuperview()
        }
    }
}

extension EventDetailsTeamView {
    
    @discardableResult
    func teamImage(_ URLString: String, placeHolder: UIImage?) -> Self {
        teamImageView.imageFromServerURL(URLString, placeHolder: placeHolder)
        return self
    }
    
    @discardableResult
    func teamLabel(_ label: String) -> Self {
        teamLabelView.text = label
        return self
    }
}
