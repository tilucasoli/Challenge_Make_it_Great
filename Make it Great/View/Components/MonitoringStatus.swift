//
//  MonitoringStatus.swift
//  Make it Great
//
//  Created by Elias Ferreira on 26/11/20.
//

import UIKit

class MonitoringStatus: UIView {

    lazy var emojiLabel: UILabel = {
        let label = UILabel()
        label.text = "🥳"
        return label
    }()

    lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.text = "Parabéns! Você está limpo há"
        label.font = UIFont.systemFont(ofSize: 16)
        //label.textColor = .gray
        return label
    }()

    lazy var daysLabel: UILabel = {
        let label = UILabel()
        label.text = "7 dias"
        label.font = UIFont.systemFont(ofSize: 27)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.addSubview(emojiLabel)
        self.addSubview(messageLabel)
        self.addSubview(daysLabel)

        self.setUpLabels()
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
            emojiLabel.widthAnchor.constraint(equalToConstant: 27),
            emojiLabel.heightAnchor.constraint(equalTo: emojiLabel.widthAnchor)
        ])

        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: self.topAnchor),
            messageLabel.leftAnchor.constraint(equalTo: emojiLabel.rightAnchor, constant: 21),
            messageLabel.rightAnchor.constraint(equalTo: self.rightAnchor)
        ])

        daysLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            daysLabel.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: -5),
            daysLabel.leftAnchor.constraint(equalTo: emojiLabel.rightAnchor, constant: 21),
            daysLabel.rightAnchor.constraint(equalTo: self.rightAnchor)
        ])
    }
}
