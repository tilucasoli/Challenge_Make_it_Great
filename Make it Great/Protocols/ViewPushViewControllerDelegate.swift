//
//  PushFormFlowDelegate.swift
//  Make it Great
//
//  Created by Lucas Oliveira on 26/11/20.
//

import UIKit

protocol ViewPushViewControllerDelegate: UIViewController {
    func pushFormViewController()
    func pushInformationViewController(date: Date)
}
