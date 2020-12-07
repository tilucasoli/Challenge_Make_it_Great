//
//  MonitoringPresenter.swift
//  Make it Great
//
//  Created by Ana Karolina Costa da Silva on 03/12/20.
//

import Foundation

class MonitoringPresenter {

    let coreDataManager = UserModel()
    let user: User

    init() {
        
        user = coreDataManager.readUser()!
    }
    func formWasSubmited(actualDate: Date) -> Bool {
        if let _ = UserModel().readDaily(actualDate: actualDate) {
            return true
        }
        return false
    }

    func requestDaysWithoutDrunk() -> Date? {
        print(user.dayLastDrink?.timeIntervalSinceNow)
        return user.dayLastDrink
    }

    func requestUserName() -> String {
        return user.name!
    }

    func areYouDrunk(in date: Date) -> Bool {
        if let _ = coreDataManager.readDaily(actualDate: date) {
            return true
        }
        return false
    }
}
