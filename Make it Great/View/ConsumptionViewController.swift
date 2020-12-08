//
//  ConsumptionViewController.swift
//  Make it Great
//
//  Created by Elias Ferreira on 25/11/20.
//

import UIKit

class ConsumptionViewController: FormTemplateViewController {

    let consumptionContent = ConsumptionContent()
    let presenter = MonitoringPresenter()
    var humor: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addAnswerContent(contentView: consumptionContent)

        consumptionContent.cleanCard.delegate = self
        consumptionContent.fewCard.delegate = self
        consumptionContent.lotCard.delegate = self

        let backButton = UIBarButtonItem()
        backButton.title = ""
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
}

extension ConsumptionViewController: CardDelegate {
    func cardAction(indice: Int) {
        if presenter.saveDaily(mood: humor!, hadDrunk: indice) {
            navigationController?.popToRootViewController(animated: true)
        }
    }
}
