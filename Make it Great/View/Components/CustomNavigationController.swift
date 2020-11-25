//
//  CustomNavigationController.swift
//  Make it Great
//
//  Created by Lucas Oliveira on 24/11/20.
//

import UIKit
// Preciso fazer o delegate para passar a informação de progresso, provavelmente implementar com o elias
class CustomNavigationController: UINavigationController {

    let progressLabel: UILabel = {
        let label = UILabel()
        label.text = "1/2: Humor"
        label.textColor = .green
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupVisualNavigationController()
        setupProgressLabel()

    }

    func setupProgressLabel() {
        navigationBar.addSubview(progressLabel)
        progressLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            progressLabel.rightAnchor.constraint(equalTo: navigationBar.rightAnchor, constant: -40),
            progressLabel.centerYAnchor.constraint(equalTo: navigationBar.centerYAnchor)
        ])
    }

    func setupVisualNavigationController() {
        navigationBar.backIndicatorImage = UIImage(named: "back button")

        navigationBar.isTranslucent = false
        navigationBar.barTintColor = .grayOne

        // Remove the separator, line below the UINavigationController
        navigationBar.shadowImage = UIImage()

    }
}
