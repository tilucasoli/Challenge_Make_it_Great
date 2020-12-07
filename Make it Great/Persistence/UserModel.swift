//
//  UserModel.swift
//  Make it Great
//
//  Created by Ana Karolina Costa da Silva on 30/11/20.
//

import UIKit
import CoreData

class UserModel {
    let coreDataStack = CoreDataStack.shared

    func createUser(name: String, dayLastDrink: Date) -> Bool {
        let entity = NSEntityDescription.entity(forEntityName: "User", in: coreDataStack.mainContext)!
        let user = User(entity: entity, insertInto: coreDataStack.mainContext)

        user.name = name
        user.dayLastDrink = dayLastDrink

        do {
            try coreDataStack.mainContext.save()
            return true
        } catch let error as NSError {
            print(error)
            return false
        }
    }

    func readUser() -> User? {
        let userRequest: NSFetchRequest<User> = User.fetchRequest()

        do {
            let userArray = try coreDataStack.mainContext.fetch(userRequest)
            let user = userArray.first
            try coreDataStack.mainContext.save()
            return user
        } catch let error as NSError {
            print(error)
            return nil
        }
    }

    func createDaily(mood: Int, date: Date, hadDrink: Int) -> Bool {
        let entity = NSEntityDescription.entity(forEntityName: "Daily", in: coreDataStack.mainContext)!
        let daily = Daily(entity: entity, insertInto: coreDataStack.mainContext)

        daily.mood = Int16(mood)
        daily.date = date
        daily.hadDrink = Int16(hadDrink)

        do {
            try coreDataStack.mainContext.save()
            return true
        } catch let error as NSError {
            print(error)
            return false
        }
    }

    func readDaily(actualDate: Date) -> Daily? {
        let dailyRequest: NSFetchRequest<Daily> = Daily.fetchRequest()

        var calendar = Calendar.current
        calendar.timeZone = NSTimeZone.local

        let firstHourOfDate = calendar.startOfDay(for: actualDate) // eg. 2016-10-10 00:00:00
        let firstHourOfNextDay = calendar.date(byAdding: .day, value: 1, to: firstHourOfDate)

        let fromPredicate = NSPredicate(format: "date >= %@", firstHourOfDate as NSDate)
        let toPredicate = NSPredicate(format: "date < %@", firstHourOfNextDay! as NSDate)
        let datePredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [fromPredicate, toPredicate])

        dailyRequest.predicate = datePredicate

        print(dailyRequest)

        do {
            let dailyResults = try coreDataStack.mainContext.fetch(dailyRequest)
            if dailyResults.count > 0 {
                if let dailyResult = dailyResults.first { return dailyResult } else { return nil }
            }
        } catch let error as NSError {
            print(error)
            return nil
        }
        return nil
    }

    func deleteDaily(dailyDate: Date) -> Bool {
        let dailyRequest: NSFetchRequest<Daily> = Daily.fetchRequest()
        dailyRequest.predicate = NSPredicate(format: "date == %@", dailyDate as CVarArg)

        do {
            let dailyResults = try coreDataStack.mainContext.fetch(Daily.fetchRequest())
            if let object = dailyResults.first as? NSManagedObject {
                coreDataStack.mainContext.delete(object)
                coreDataStack.saveContext()
                return true
            } else {
                return false
            }
        } catch let error as NSError {
            print(error)
            return false
        }
    }
}
