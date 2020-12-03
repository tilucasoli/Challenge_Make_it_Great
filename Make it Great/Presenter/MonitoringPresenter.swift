//
//  MonitoringPresenter.swift
//  Make it Great
//
//  Created by Ana Karolina Costa da Silva on 03/12/20.
//

import Foundation

class MonitoringPresenter {

    func formWasSubmited(actualDate: Date) -> Bool {
        if let _ = UserModel().readDaily(actualDate: actualDate) {
            return true
        }
        return false
    }
}
