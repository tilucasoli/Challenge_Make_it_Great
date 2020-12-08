//
//  OnboardingTemplate.swift
//  Make it Great
//
//  Created by Lucas Oliveira on 07/12/20.
//

import UIKit

class OnboardingTemplateViewController: UIViewController {
    let emojiView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGreen
        view.layer.cornerRadius = 35
        return view
    }()

    let emojiLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 32)
        return label
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Brown-Bold", size: 32)
        label.numberOfLines = .zero
        label.textColor = .grayThree
        return label
    }()

    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = .zero
        label.textColor = UIColor.grayThree.withAlphaComponent(0.8)
        return label
    }()

    let nextButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .green
        button.layer.cornerRadius = 15
        button.setTitle("Continue", for: .normal)

        let label = button.titleLabel
        label!.font = .systemFont(ofSize: 20, weight: .semibold)
        label!.textColor = .grayOne

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.backgroundColor = .grayOne

        titleLabel.setLineHeight(lineHeightMultiple: 1.22)
        descriptionLabel.setLineHeight(lineHeightMultiple: 1.12)

        setupEmojiView()
        setupEmojiLabel()
        setupTitleLabel()
        setupDescriptionLabel()
        setupNextButton()
    }

    init(emoji: String, title: String, description: String) {
        super.init(nibName: nil, bundle: nil)




        emojiLabel.text = emoji
        titleLabel.text = title
        descriptionLabel.text = description

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupEmojiView() {
        emojiView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(emojiView)

        NSLayoutConstraint.activate([
            emojiView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            emojiView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
            emojiView.heightAnchor.constraint(equalToConstant: 70),
            emojiView.widthAnchor.constraint(equalToConstant: 70)
        ])
    }

    func setupEmojiLabel() {
        emojiLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(emojiLabel)

        NSLayoutConstraint.activate([
            emojiLabel.centerXAnchor.constraint(equalTo: emojiView.centerXAnchor),
            emojiLabel.centerYAnchor.constraint(equalTo: emojiView.centerYAnchor)
        ])
    }

    func setupTitleLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: emojiView.bottomAnchor, constant: 24),
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
            titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40)
        ])
    }

    func setupDescriptionLabel() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(descriptionLabel)

        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            descriptionLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
            descriptionLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40)
        ])
    }

    func setupNextButton() {
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nextButton)

        NSLayoutConstraint.activate([
            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24),
            nextButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40),
            nextButton.heightAnchor.constraint(equalToConstant: 65),
            nextButton.widthAnchor.constraint(equalToConstant: 190)
        ])
    }

    
}
