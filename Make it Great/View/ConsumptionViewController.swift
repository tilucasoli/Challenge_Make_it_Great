//
//  ConsumptionViewController.swift
//  Make it Great
//
//  Created by Elias Ferreira on 25/11/20.
//

import UIKit

class ConsumptionViewController: FormTemplateViewController {

    let consumptionContent = ConsumptionContent()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addAnswerContent(contentView: consumptionContent)

        consumptionContent.cleanCard.delegate = self
        consumptionContent.fewCard.delegate = self
        consumptionContent.lotCard.delegate = self
    }
}

extension ConsumptionViewController: CardDelegate {
    func cardAction(title: String) {
        print(title)
    }
}
