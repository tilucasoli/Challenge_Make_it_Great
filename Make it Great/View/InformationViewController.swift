//
//  InformationViewController.swift
//  Make it Great
//
//  Created by Cristiano Coutinho on 03/12/20.
//

import UIKit

class InformationViewController: UIViewController {

    let informationView = InformationView()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view = informationView

    }


}
