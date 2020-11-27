//
//  DataCell.swift
//  Make it Great
//
//  Created by Lucas Oliveira on 25/11/20.
//

import JTAppleCalendar
import UIKit

class DateCell: JTACDayCell {
    let dayLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = .grayFive
        return label
    }()

    private let selectedDateView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.backgroundColor = .green
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
//        setupSelectedDateView()
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
        addSubview(selectedDateView)
        selectedDateView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            selectedDateView.centerXAnchor.constraint(equalTo: centerXAnchor),
            selectedDateView.centerYAnchor.constraint(equalTo: centerYAnchor),
            selectedDateView.heightAnchor.constraint(equalToConstant: 36),
            selectedDateView.widthAnchor.constraint(equalToConstant: 36)
        ])
    }
    
}
