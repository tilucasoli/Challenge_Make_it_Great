//
//  GoToForm.swift
//  Make it Great
//
//  Created by Elias Ferreira on 26/11/20.
//

import UIKit

class GoToForm: UIView {

    var delegate: ViewPushViewControllerDelegate?

    lazy var labelTitle: UILabel = {
        let label = UILabel()
        label.text = "Tudo Bom?"
        label.font = UIFont(name: "Brown-Bold", size: 24)
        label.textColor = .grayFive
        return label
    }()

    lazy var labelDescription: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Percebemos que os dados diários ainda não foram inseridos, lembre-se que você não está só."
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .grayFive
        return label
    }()

    lazy var formButton: UIButton = {
        let button = UIButton()
        button.setTitle("Adicionar", for: .normal)
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(pushAddFlow), for: .touchDown)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.addSubview(labelTitle)
        self.addSubview(labelDescription)
        self.addSubview(formButton)

        self.setUpLabels()
        self.setUpButton()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        formButton.layer.cornerRadius = 6
    }

}

extension GoToForm {
    @objc func pushAddFlow() {
        delegate?.pushFormViewController()
    }
}

extension GoToForm {
    func setUpLabels() {
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelTitle.topAnchor.constraint(equalTo: self.topAnchor),
            labelTitle.leftAnchor.constraint(equalTo: self.leftAnchor),
        ])

        labelDescription.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelDescription.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 6),
            labelDescription.leftAnchor.constraint(equalTo: self.leftAnchor),
            labelDescription.rightAnchor.constraint(equalTo: self.rightAnchor)
        ])
    }

    func setUpButton() {
        formButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            formButton.topAnchor.constraint(equalTo: labelDescription.bottomAnchor, constant: 21),
            formButton.leftAnchor.constraint(equalTo: self.leftAnchor),
            formButton.rightAnchor.constraint(equalTo: self.rightAnchor),
            formButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            formButton.heightAnchor.constraint(equalToConstant: 46)
        ])
    }
}
