//
//  WeekLabels.swift
//  Make it Great
//
//  Created by Lucas Oliveira on 26/11/20.
//

import UIKit
class StackWeekLabel: UIStackView {

    let weekNamesArray = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStackViewContent()
        setupStackView()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
extension StackWeekLabel {
    func weekLabelFactory(text: String) -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11, weight: .semibold)
        label.textColor = #colorLiteral(red: 0.231372549, green: 0.3411764706, blue: 0.3411764706, alpha: 1)
        label.text = text
        label.textAlignment = .center
        return label
    }

    func setupStackViewContent() {
        for weekName in weekNamesArray {
            let weekLabel = weekLabelFactory(text: weekName)
            addArrangedSubview(weekLabel)
        }
    }

    func setupStackView() {
        axis = .horizontal
        spacing = 0
        alignment = .center
        distribution = .fillEqually
    }
}
