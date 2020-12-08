//
//  ViewController.swift
//  Make it Great
//
//  Created by Lucas Oliveira on 07/12/20.
//

import UIKit

class IntroductionOnboardingViewController: OnboardingTemplateViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.addTarget(self, action: #selector(pushInputNameViewController), for: .touchDown)
    }

}
extension IntroductionOnboardingViewController {
    @objc func pushInputNameViewController() {
        let newViewController = InputNameOnboardingViewController(emoji: "💬", title: "Como podemos te chamar?", description: "Nos preocupamos em como devemos te chamar visando melhorar a sua experiência.")
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
}
