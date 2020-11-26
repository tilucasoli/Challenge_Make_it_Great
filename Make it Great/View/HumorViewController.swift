//
//  HumorViewController.swift
//  Make it Great
//
//  Created by Elias Ferreira on 25/11/20.
//

import UIKit

class HumorViewController: FormTemplateViewController {
    let humorContent = HumorContent()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addAnswerContent(contentView: humorContent)

        humorContent.happyCard.delegate = self
        humorContent.sadCard.delegate = self
        humorContent.thankfullCard.delegate = self
        humorContent.stressfullCard.delegate = self
    }
}

extension HumorViewController: CardDelegate {
    func cardAction(title: String) {
        print(title)
    }
}
