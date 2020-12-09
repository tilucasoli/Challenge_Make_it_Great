//
//  HumorContent.swift
//  Make it Great
//
//  Created by Elias Ferreira on 25/11/20.
//

import UIKit

class HumorContent: UIView {

    let happyCard = ChooseCard()
    let thankfullCard = ChooseCard()
    let sadCard = ChooseCard()
    let stressfullCard = ChooseCard()

    override init(frame: CGRect) {
        super.init(frame: frame)
        happyCard.setContent(emoji: "😆", cardTitle: "Muito Feliz")
        happyCard.indice = 1
        thankfullCard.setContent(emoji: "😍", cardTitle: "Grato(a)")
        thankfullCard.indice = 2
        sadCard.setContent(emoji: "😞", cardTitle: "Muito Triste")
        sadCard.indice = 3
        stressfullCard.setContent(emoji: "😤", cardTitle: "Estressado(a)")
        stressfullCard.indice = 4

        self.addSubview(happyCard)
        self.addSubview(thankfullCard)
        self.addSubview(sadCard)
        self.addSubview(stressfullCard)

        self.setUpHappyCard()
        self.setUpThankfullCard()
        self.setUpSadCard()
        self.setUpStressfullCard()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HumorContent {
    func setUpHappyCard() {
        happyCard.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            happyCard.heightAnchor.constraint(equalToConstant: 148),
            happyCard.widthAnchor.constraint(equalToConstant: 136),
            happyCard.topAnchor.constraint(equalTo: self.topAnchor),
            happyCard.leftAnchor.constraint(equalTo: self.leftAnchor)
        ])
    }

    func setUpThankfullCard() {
        thankfullCard.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            thankfullCard.heightAnchor.constraint(equalToConstant: 148),
            thankfullCard.widthAnchor.constraint(equalToConstant: 136),
            thankfullCard.topAnchor.constraint(equalTo: self.topAnchor),
            thankfullCard.rightAnchor.constraint(equalTo: self.rightAnchor)
        ])
    }

    func setUpSadCard() {
        sadCard.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sadCard.heightAnchor.constraint(equalToConstant: 148),
            sadCard.widthAnchor.constraint(equalToConstant: 136),
            sadCard.topAnchor.constraint(equalTo: happyCard.bottomAnchor, constant: 24),
            sadCard.leftAnchor.constraint(equalTo: self.leftAnchor)
        ])
    }

    func setUpStressfullCard() {
        stressfullCard.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stressfullCard.heightAnchor.constraint(equalToConstant: 148),
            stressfullCard.widthAnchor.constraint(equalToConstant: 136),
            stressfullCard.topAnchor.constraint(equalTo: thankfullCard.bottomAnchor, constant: 24),
            stressfullCard.rightAnchor.constraint(equalTo: self.rightAnchor)
        ])
    }
}
