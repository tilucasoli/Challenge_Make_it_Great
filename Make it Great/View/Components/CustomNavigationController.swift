//
//  CustomNavigationController.swift
//  Make it Great
//
//  Created by Lucas Oliveira on 24/11/20.
//

import UIKit

class CustomNavigationController: UINavigationController {

    let progressLabel: UILabel = {
        let label = UILabel()
        label.textColor = .green
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLargeTitleApperance()
        setupVisualNavigationController()
        setupProgressLabel()
        view.backgroundColor = .clear

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

        let image = UIImage(systemName: "arrow.left")
        navigationBar.backIndicatorImage = image
        navigationBar.backIndicatorTransitionMaskImage = image

        navigationBar.barTintColor = .grayOne
        navigationBar.tintColor = .green

        // Remove the separator, line below the UINavigationController
        navigationBar.shadowImage = UIImage()

    }

    func setupLargeTitleApperance() {
        navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Brown-Bold", size: 32)!, NSAttributedString.Key.foregroundColor: UIColor.grayThree]
    }
}
