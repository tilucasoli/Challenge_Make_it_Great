//
//  DataCell.swift
//  Make it Great
//
//  Created by Lucas Oliveira on 25/11/20.
//

import JTAppleCalendar
import UIKit

class DateCell: JTACDayCell {
    private var cellState: CellState?

    private let dayLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    private let highlightedView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()

    private var rightMergeView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGreen
        view.isHidden = true
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupRightMergeView()
        setupSelectedDateView()
        setupDayLabel()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupDayLabel() {
        addSubview(dayLabel)
        dayLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            dayLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            dayLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    private func setupSelectedDateView() {
        addSubview(highlightedView)
        highlightedView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            highlightedView.centerXAnchor.constraint(equalTo: centerXAnchor),
            highlightedView.centerYAnchor.constraint(equalTo: centerYAnchor),
            highlightedView.heightAnchor.constraint(equalToConstant: 36),
            highlightedView.widthAnchor.constraint(equalToConstant: 36)
        ])
    }

    private func setupRightMergeView() {
        addSubview(rightMergeView)
        rightMergeView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            rightMergeView.leftAnchor.constraint(equalTo: centerXAnchor),
            rightMergeView.centerYAnchor.constraint(equalTo: centerYAnchor),
            rightMergeView.heightAnchor.constraint(equalToConstant: 36),
            rightMergeView.widthAnchor.constraint(equalToConstant: 46)
        ])
    }

    func configure(cellState: CellState) {
        dayLabel.text = cellState.text
        self.cellState = cellState
    }
    
}

extension DateCell {

    func highlightedViewSelectableCurrentDay() {
        highlightedView.layer.cornerRadius = 18
        highlightedView.backgroundColor = .green

        dayLabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        dayLabel.textColor = .grayOne

    }

    func highlightedViewAddedCurrentDay() {
        highlightedView.layer.cornerRadius = 5
        highlightedView.backgroundColor = .green

        dayLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        dayLabel.textColor = .grayOne
    }

    func highlightedViewSequenceDay() {
        highlightedView.layer.cornerRadius = 5
        highlightedView.backgroundColor = .lightGreen

        dayLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        dayLabel.textColor = .grayFive
    }

    func highlightedViewNormalDay() {
        highlightedView.isHidden = true

        dayLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        dayLabel.textColor = .grayFive
    }

    func activeRightMergeView(_ bool: Bool) {
        rightMergeView.isHidden = bool

        if cellState?.day.rawValue != 7 {
            rightMergeView.isHidden = false
        }

    }
}
