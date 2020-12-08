//
//  InformationViewController.swift
//  Make it Great
//
//  Created by Cristiano Coutinho on 03/12/20.
//

import UIKit

class InformationViewController: UIViewController {
    // View
    let informationView = InformationView()
    var daily: Daily?

    // Right Navigation Button
    lazy var buttonDelete: UIBarButtonItem = {
        let barButton = UIBarButtonItem()
        barButton.title = "Delete"
        barButton.tintColor = .green
        barButton.setTitleTextAttributes(
            [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17, weight: .semibold)],
            for: .normal
        )
        barButton.target = self
        barButton.action = #selector(deleteAction)
        return barButton
    }()

    // Left Navigation Button
    lazy var buttonDone: UIBarButtonItem = {
        let barButton = UIBarButtonItem()
        barButton.title = "Done"
        barButton.tintColor = .green
        barButton.setTitleTextAttributes(
            [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17)],
            for: .normal
        )
        barButton.target = self
        barButton.action = #selector(doneAction)
        return barButton
    }()

    // MARK: Lifecycle
    override func loadView() {
        super.loadView()
        view = informationView
        title = "03-12-2020"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationController()
        configureMood()
        configureConsume()
    }

    // MARK: Functions
    func setupNavigationController() {
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.topItem?.rightBarButtonItem = buttonDelete
        navigationController?.navigationBar.topItem?.leftBarButtonItem = buttonDone
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17, weight: .semibold)
        ]
    }

    func configureMood() {
        switch daily!.mood {
        case 1:
            informationView.cardHumor.setContent(emoji: "😆", cardTitle: "Muito Feliz")
        case 2:
            informationView.cardHumor.setContent(emoji: "😍", cardTitle: "Grato")
        case 3:
            informationView.cardHumor.setContent(emoji: "😆", cardTitle: "Muito Feliz")
        case 4:
            informationView.cardHumor.setContent(emoji: "😤", cardTitle: "Estressado")
        default:
            return
        }
    }

    func configureConsume() {
        switch daily!.hadDrink {
        case 1:
            informationView.cardConsume.setContent(emoji: "🥳", cardTitle: "Estou limpo!")
        case 2:
            informationView.cardConsume.setContent(emoji: "🥃", cardTitle: "Um pouco")
        case 3:
            informationView.cardConsume.setContent(emoji: "🍺", cardTitle: "Bastante")
        default:
            return
        }
    }
}

// MARK: - Actions

extension InformationViewController {
    @objc func deleteAction() {
        print("Testando Delete")
    }

    @objc func doneAction() {
        print("Testando Done")
        self.dismiss(animated: true, completion: nil)
    }
}
