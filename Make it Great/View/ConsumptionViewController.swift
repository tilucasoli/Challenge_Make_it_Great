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
    }
}
