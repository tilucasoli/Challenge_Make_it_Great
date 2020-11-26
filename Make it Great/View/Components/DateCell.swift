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
        label.textColor = #colorLiteral(red: 0.231372549, green: 0.3411764706, blue: 0.3411764706, alpha: 1)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupDayLabel()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupDayLabel() {
        addSubview(dayLabel)
        dayLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            dayLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            dayLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
