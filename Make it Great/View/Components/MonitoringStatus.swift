//
//  MonitoringStatus.swift
//  Make it Great
//
//  Created by Elias Ferreira on 26/11/20.
//

import UIKit

class MonitoringStatus: UIView {

    let emojiLabel: UILabel = {
        let label = UILabel()
        label.text = "🥳"
        label.font = UIFont.systemFont(ofSize: 27)
        return label
    }()

    let messageLabel: UILabel = {
        let label = UILabel()
        label.text = "Parabéns! Você está limpo há"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .grayFive
        return label
    }()

    let daysLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Brown-Bold", size: 27)
        label.textColor = .grayFive
        return label
    }()

    init(lastDayDrunk: String) {
        super.init(frame: CGRect())

        self.addSubview(emojiLabel)
        self.addSubview(messageLabel)
        self.addSubview(daysLabel)
        self.setUpLabels()

        daysLabel.text = lastDayDrunk
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - CONSTRAITNS

extension MonitoringStatus {
    func setUpLabels() {
        emojiLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emojiLabel.leftAnchor.constraint(equalTo: self.leftAnchor),
            emojiLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            emojiLabel.widthAnchor.constraint(equalToConstant: 35),
            emojiLabel.heightAnchor.constraint(equalToConstant: 35)
        ])

        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: self.topAnchor),
            messageLabel.leftAnchor.constraint(equalTo: emojiLabel.rightAnchor, constant: 21),
            messageLabel.rightAnchor.constraint(equalTo: self.rightAnchor)
        ])

        daysLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            daysLabel.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 6),
            daysLabel.leftAnchor.constraint(equalTo: emojiLabel.rightAnchor, constant: 21),
            daysLabel.rightAnchor.constraint(equalTo: self.rightAnchor)
        ])
    }
}
