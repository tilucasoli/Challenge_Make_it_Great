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
    }
}
