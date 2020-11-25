//
//  FormTemplateViewController.swift
//  Make it Great
//
//  Created by Lucas Oliveira on 24/11/20.
//

import UIKit

class FormTemplateViewController: UIViewController {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Brown-Bold", size: 32)
        label.numberOfLines = .zero
        label.textColor = .grayThree

        return label
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = .zero
        label.textColor = .grayTwo
        return label
    }()

    private let answerContentView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()

    init(titleText: String, descriptionText: String) {
        super.init(nibName: nil, bundle: nil)

        titleLabel.text = titleText
        descriptionLabel.text = descriptionText
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTitleLabel()
        setupDescription()
        setupAnswerContentView()

        // This function was used here, because it need that there is a text inside UILabel
        titleLabel.setLineHeight(lineHeightMultiple: 1.22)
        descriptionLabel.setLineHeight(lineHeightMultiple: 1.12)

        view.backgroundColor = .grayOne

    }
    
    private func setupTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 56),
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
            titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40)
        ])
    }

    private func setupDescription() {
        view.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
          descriptionLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
          descriptionLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40),
        ])
    }

    private func setupAnswerContentView() {
        view.addSubview(answerContentView)
        answerContentView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            answerContentView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 40),
            answerContentView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
            answerContentView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40),
            answerContentView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

// MARK: - Add Answer Content function
  
    func addAnswerContent(contentView: UIView) {
        answerContentView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: answerContentView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: answerContentView.bottomAnchor),
            contentView.leftAnchor.constraint(equalTo: answerContentView.leftAnchor),
            contentView.rightAnchor.constraint(equalTo: answerContentView.rightAnchor)
        ])
        
    }
}
