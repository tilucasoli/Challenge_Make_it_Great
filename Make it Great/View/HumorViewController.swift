//
//  HumorViewController.swift
//  Make it Great
//
//  Created by Elias Ferreira on 25/11/20.
//

import UIKit

class HumorViewController: FormTemplateViewController {

    let humorContent = HumorContent()
    var customNavigationController: CustomNavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addAnswerContent(contentView: humorContent)
        customNavigationController = (self.navigationController as? CustomNavigationController)!

        humorContent.happyCard.delegate = self
        humorContent.sadCard.delegate = self
        humorContent.thankfullCard.delegate = self
        humorContent.stressfullCard.delegate = self

    }

    override func viewWillAppear(_ animated: Bool) {
        customNavigationController?.progressLabel.text = "1/2: Humor"
    }
}

extension HumorViewController: CardDelegate {
    func cardAction(title: String) {
        print(title)

       let consumptionViewController = ConsumptionViewController(titleText: "Quanto você já bebeu hoje?", descriptionText: "Usamos este dado para te ajudar a estimar o quanto você consumiu!")

        customNavigationController?.progressLabel.text = "2/2: Consumo"

        self.navigationController?.pushViewController(consumptionViewController, animated: true)

    }
}
