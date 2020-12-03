//
//  InformationView.swift
//  Make it Great
//
//  Created by Cristiano Coutinho on 03/12/20.
//

import UIKit

class InformationView: UIView {

    lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Brown-Bold", size: 24) // adicionar font personalizada
        label.textColor = .grayFive
        label.text = "Informações"
        return label
    }()

    lazy var yourHumor: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .grayFive
        label.text = "Seu Humor"
        return label
    }()

    lazy var yourConsume: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .grayFive
        label.text = "Seu Consumo"
        return label
    }()

    let cardHumor = ChooseCard()
    let cardConsume = ChooseCard()

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.backgroundColor = .grayOne

        //adicionar conteúdo Mocado
        cardHumor.setContent(emoji: "😍", cardTitle: "Grato")
        cardConsume.setContent(emoji: "🥳", cardTitle: "Estou limpo!")

        cardHumor.emojiView.backgroundColor = .lightGreen
        cardConsume.emojiView.backgroundColor = .lightGreen

        // Adicionando SubView
        self.addSubview(infoLabel)
        self.addSubview(yourHumor)
        self.addSubview(cardHumor)
        self.addSubview(yourConsume)
        self.addSubview(cardConsume)

        // Setup das Contraints
        setupInfoLabel()
        setupYourHumor()
        setupCardHumor()
        setupYourConsume()
        setupCardConsume()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - Constraints

extension InformationView{

    func setupInfoLabel(){
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
            infoLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            infoLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20)
        ])
    }

    func setupYourHumor(){
        yourHumor.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            yourHumor.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 16.4),
            yourHumor.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            yourHumor.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20)
        ])
    }

    func setupCardHumor(){
        cardHumor.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardHumor.topAnchor.constraint(equalTo: yourHumor.bottomAnchor, constant: 16.6),
            cardHumor.widthAnchor.constraint(equalToConstant: 131),
            cardHumor.heightAnchor.constraint(equalToConstant: 148),
            cardHumor.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }

    func setupYourConsume(){
        yourConsume.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            yourConsume.topAnchor.constraint(equalTo: cardHumor.bottomAnchor, constant: 16.4),
            yourConsume.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            yourConsume.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20)
        ])
    }

    func setupCardConsume(){
        cardConsume.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardConsume.topAnchor.constraint(equalTo: yourConsume.bottomAnchor, constant: 16.6),
            cardConsume.widthAnchor.constraint(equalToConstant: 294),
            cardConsume.heightAnchor.constraint(equalToConstant: 148),
            cardConsume.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }

}
