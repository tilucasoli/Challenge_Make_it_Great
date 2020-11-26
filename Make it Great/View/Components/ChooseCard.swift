//
//  ChooseCard.swift
//  Make it Great
//
//  Created by Elias Ferreira on 25/11/20.
//

import UIKit

protocol CardDelegate {
    func cardAction(title: String)
}

class ChooseCard: UIView {

    lazy var emojiView: UIView = {
        let view = UIView()
        view.backgroundColor = .grayFour
        return view
    }()

    lazy var emojiLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 29)
        return label
    }()

    lazy var cardTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 21)
        label.textColor = .grayThree
        return label
    }()

    var delegate: CardDelegate? = nil

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white

        emojiView.addSubview(emojiLabel)
        self.addSubview(emojiView)
        self.addSubview(cardTitle)

        self.setUpEmojiView()
        self.setUpEmojiLabel()
        self.setUpCardTitle()

        self.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(cardAction))
        self.addGestureRecognizer(gestureRecognizer)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func cardAction() {
        //print("Clicou no card \(self.cardTitle.text!)!")
        self.delegate?.cardAction(title: self.cardTitle.text!)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 12
        emojiView.layer.cornerRadius = emojiView.frame.height / 2
    }

    func setContent(emoji: String, cardTitle: String) {
        self.emojiLabel.text = emoji
        self.cardTitle.text = cardTitle
    }

}

// MARK: - CONSTRAINTS

extension ChooseCard {
    func setUpEmojiView() {
        emojiView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emojiView.heightAnchor.constraint(equalToConstant: 67),
            emojiView.widthAnchor.constraint(equalTo: emojiView.heightAnchor),
            emojiView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            emojiView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }

    func setUpCardTitle() {
        cardTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardTitle.topAnchor.constraint(equalTo: emojiView.bottomAnchor, constant: 18),
            cardTitle.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -18),
            cardTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }

    func setUpEmojiLabel() {
        emojiLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emojiLabel.centerXAnchor.constraint(equalTo: emojiView.centerXAnchor),
            emojiLabel.centerYAnchor.constraint(equalTo: emojiView.centerYAnchor)
        ])
    }
}
