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

    func createUser(name: String, dayLastDrink: Date) -> Bool {
        let user = User()
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

    func readDaily(actualDate: Date) -> Daily? {
        let dailyRequest: NSFetchRequest<Daily> = Daily.fetchRequest()
        dailyRequest.predicate = NSPredicate(format: "date == %@", actualDate as CVarArg)

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
