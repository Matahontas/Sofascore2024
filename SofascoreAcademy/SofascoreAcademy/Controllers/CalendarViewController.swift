//
//  CalendarViewController.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 05.05.2024..
//

import Foundation
import SnapKit
import SofaAcademic
import UIKit

class CalendarViewController: UIViewController, BaseViewProtocol {
    
    private var currentDateIndex: Int = 7
    private let currentDateViewIndicator: UIView = .init()
    private var currentDateViewIndicatorLeadingConstraint: Constraint?
    weak var delegate: CalendarItemDelegateProtocol?
    private let dateFormatter: DateFormatter = .init()
    private lazy var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CalendarCollectionCell.self, forCellWithReuseIdentifier: "calendarCell")
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
        setupConstraints()
        styleViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let initialIndexPath = IndexPath(item: currentDateIndex, section: 0)
//        UserDefaultsHelper.selectedDateApiSlug = TabItemHelper.getSportSlugFromTabIndex(currentDateIndex)
        collectionView.selectItem(at: initialIndexPath, animated: true, scrollPosition: .centeredHorizontally)
    }
    
    func addViews() {
        
        view.addSubview(collectionView)
        view.addSubview(currentDateViewIndicator)
    }
    
    func setupConstraints() {
        
        collectionView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(48)
        }
        currentDateViewIndicator.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.height.equalTo(4)
            $0.width.equalTo(48)
            currentDateViewIndicatorLeadingConstraint =
            $0.leading.equalToSuperview().offset(Int(UIScreen.main.bounds.width)/2 - 24).constraint
        }
    }
    
    func styleViews() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        currentDateViewIndicator.backgroundColor = .sofaWhite
    }
}

extension CalendarViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 56, height: 48)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "calendarCell", for: indexPath) as? CalendarCollectionCell else {
            return UICollectionViewCell()
        }
        
        let currentDate = Date()
        guard let dateToShow = Calendar.current.date(byAdding: .day, value: indexPath.item - currentDateIndex, to: currentDate) else {
            return UICollectionViewCell()
        }
        dateFormatter.dateFormat = "EEE"
        let dayLabel = dateFormatter.string(from: dateToShow).uppercased()
        
        dateFormatter.dateFormat = "dd.MM."
        let dateLabel = dateFormatter.string(from: dateToShow)
        
        if Calendar.current.isDateInToday(dateToShow) {
            cell.set(calendarDayLabel: .current_day_uppercase, calendarDateLabel: dateLabel)
        } else {
            cell.set(calendarDayLabel: dayLabel, calendarDateLabel: dateLabel)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let currentDate = Date()
        let dateToShow = Calendar.current.date(byAdding: .day, value: indexPath.item - currentDateIndex, to: currentDate)
        
        dateFormatter.dateFormat = "YYYY-MM-dd"
        UserDefaultsHelper.selectedDateApiSlug = dateFormatter.string(from: dateToShow ?? Date())
        UserDefaultsHelper.selectedDateIndex = indexPath.item
        
        delegate?.calendarItemTapped()
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
}

extension CalendarViewController {
    
    @discardableResult
    func updateCurrentDateViewIndicatorPosition() -> Self {
        
        let index = CalendarViewHelper.calculateIndexForDateIndicatorOffset(UserDefaultsHelper.selectedDateIndex)
        currentDateViewIndicatorLeadingConstraint?.update(offset: index * (Int(UIScreen.main.bounds.width) / 7) + 4)
        return self
    }
    
    @discardableResult
    func animateCurrentDateViewIndicator() -> Self {
        
        UIView.animate(animations: {
            self.view.layoutIfNeeded()
        }) {_ in
            self.currentDateViewIndicator.layer.add(AnimationsHelper.applyFadeTransition(), forKey: "currentDateViewIndicatorTransition")
        }
        return self
    }
}
