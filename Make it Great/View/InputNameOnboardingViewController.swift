//
//  IntroductionOnboarding.swift
//  Make it Great
//
//  Created by Lucas Oliveira on 07/12/20.
//

import UIKit

class InputNameOnboardingViewController: OnboardingTemplateViewController {
    let textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Ex: Jones"
        textField.font = .systemFont(ofSize: 17, weight: .medium)
        textField.textColor = UIColor.grayThree.withAlphaComponent(0.5)
        textField.backgroundColor = UIColor.lightGreen.withAlphaComponent(0.3)
        textField.layer.cornerRadius = 15
        textField.setLeftPadding(16)
        textField.keyboardType = .default
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextField()

        let gesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(gesture)

        nextButton.addTarget(self, action: #selector(pushMonitoringViewController), for: .touchDown)
    }

    func setupTextField() {
        textField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textField)

        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 24),
            textField.heightAnchor.constraint(equalToConstant: 56),
            textField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
            textField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40)
        ])
    }
    
}

extension InputNameOnboardingViewController {

    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }

    @objc func pushMonitoringViewController(){
        let newViewController = MonitoringViewController()
        self.navigationController?.pushViewController(newViewController, animated: true)
    }

}
