//
//  ConsumptionContent.swift
//  Make it Great
//
//  Created by Elias Ferreira on 25/11/20.
//

import UIKit

class ConsumptionContent: UIView {

    let cleanCard = ChooseCard()
    let fewCard = ChooseCard()
    let lotCard = ChooseCard()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        cleanCard.setContent(emoji: "🥳", cardTitle: "Estou limpo(a)!")
        cleanCard.indice = 1
        fewCard.setContent(emoji: "🥃", cardTitle: "Um pouco")
        fewCard.indice = 2
        lotCard.setContent(emoji: "🍺", cardTitle: "Bastante")
        lotCard.indice = 3

        self.addSubview(cleanCard)
        self.addSubview(fewCard)
        self.addSubview(lotCard)

        self.setUpCleanCard()
        self.setUpFewCard()
        self.setUpLotCard()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ConsumptionContent {
    func setUpCleanCard() {
        cleanCard.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cleanCard.leftAnchor.constraint(equalTo: self.leftAnchor),
            cleanCard.rightAnchor.constraint(equalTo: self.rightAnchor),
            cleanCard.topAnchor.constraint(equalTo: self.topAnchor),
            cleanCard.heightAnchor.constraint(equalToConstant: 148)
        ])
    }

    func setUpFewCard() {
        fewCard.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            fewCard.heightAnchor.constraint(equalToConstant: 148),
            fewCard.widthAnchor.constraint(equalToConstant: 136),
            fewCard.topAnchor.constraint(equalTo: cleanCard.bottomAnchor, constant: 24),
            fewCard.leftAnchor.constraint(equalTo: self.leftAnchor)
        ])
    }

    func setUpLotCard() {
        lotCard.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lotCard.heightAnchor.constraint(equalToConstant: 148),
            lotCard.widthAnchor.constraint(equalToConstant: 136),
            lotCard.topAnchor.constraint(equalTo: cleanCard.bottomAnchor, constant: 24),
            lotCard.rightAnchor.constraint(equalTo: self.rightAnchor)
        ])
    }
}
