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
    var delegate: ViewPushViewControllerDelegate?
    var hasSetPointOrigin = false
    var pointOrigin: CGPoint?

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
        if let date = daily?.date {
            let today = date
            let formatter1 = DateFormatter()
            formatter1.dateFormat = "dd-MM-yyyy"
            title = formatter1.string(from: today)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationController()
        configureMood()
        configureConsume()
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureRecognizerAction))
        navigationController?.view.addGestureRecognizer(panGesture)
    }

    override func viewDidLayoutSubviews() {
      if !hasSetPointOrigin {
        hasSetPointOrigin = true
        pointOrigin = self.navigationController?.view.frame.origin
      }
    }

    // MARK: Functions
    func setupNavigationController() {
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.topItem?.rightBarButtonItem = buttonDelete
        navigationController?.navigationBar.topItem?.leftBarButtonItem = buttonDone
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17, weight: .semibold)
        ]
        self.navigationController?.navigationBar.sizeToFit()
    }

    func configureMood() {
        switch daily!.mood {
        case 1:
            informationView.cardHumor.setContent(emoji: "😆", cardTitle: "Muito Feliz")
        case 2:
            informationView.cardHumor.setContent(emoji: "😍", cardTitle: "Grato(a)")
        case 3:
            informationView.cardHumor.setContent(emoji: "😆", cardTitle: "Muito Feliz")
        case 4:
            informationView.cardHumor.setContent(emoji: "😤", cardTitle: "Estressado(a)")
        default:
            return
        }
    }

    func configureConsume() {
        switch daily!.hadDrink {
        case 1:
            informationView.cardConsume.setContent(emoji: "🥳", cardTitle: "Estou limpo(a)!")
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
        showSimpleAlert()
    }

    @objc func doneAction() {
        print("Testando Done")
        self.dismiss(animated: true, completion: nil)
    }

    func showSimpleAlert() {
        let alert = UIAlertController(title: "Deletar daily?", message: "Você tem certeza que quer deletar a daily?",         preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Cancelar", style: .default, handler: { _ in
            //Cancel Action
        }))

        alert.addAction(UIAlertAction(title: "Deletar", style: .destructive, handler: {(_: UIAlertAction!) in
            if self.delegate!.deleteDaily(date: (self.daily?.date)!) {
                self.dismiss(animated: true, completion: nil)
            }
        }))

        self.present(alert, animated: true, completion: nil)
    }

    @objc func panGestureRecognizerAction(sender: UIPanGestureRecognizer) {
      let translation = sender.translation(in: view)

      // not allowing the user to drag the view upaward.
      guard translation.y >= 0 else { return }

      // setting x as 0 because we don't want user to move the frame side ways! only want straight up and down.
      self.navigationController?.view.frame.origin = CGPoint(x: 0, y: pointOrigin!.y + translation.y)

      if sender.state == .ended {
        let dragVelocity = sender.velocity(in: view)
        if dragVelocity.y >= 1300 {
          dismiss(animated: true, completion: nil)
        } else {
          // set back to original position
          UIView.animate(withDuration: 0.3) {
            self.navigationController?.view.frame.origin = self.pointOrigin ?? CGPoint(x: 0, y: 400)

          }
        }
      }
    }
}
