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
    var dayWithoutDrunkString: String {
        get {
            return "\(requestDaysWithoutDrunk()) dias!"
        }
    }

    init() {
        user = coreDataManager.readUser()!
    }

    func formWasSubmited(actualDate: Date) -> Bool {
        if let _ = UserModel().readDaily(actualDate: actualDate) {
            return true
        }
        return false
    }

    func requestDaysWithoutDrunk() -> Int {
        let diff = Int(Date().timeIntervalSince1970 - user.dayLastDrink!.timeIntervalSince1970)
        let hours = diff / 3600
        let days = hours / 24

        return days
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

    func saveDaily(mood: Int, hadDrunk: Int) -> Bool {
        return coreDataManager.createDaily(mood: mood, date: Date(), hadDrink: hadDrunk)
    }

    func existsDaily() -> Bool {
        if let _ = coreDataManager.readDaily(actualDate: Date()) {
            return true
        } else {
            return false
        }
    }
}
