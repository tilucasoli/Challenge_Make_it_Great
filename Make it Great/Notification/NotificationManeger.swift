//
//  NotificationManeger.swift
//  Make it Great
//
//  Created by Elias Ferreira on 02/12/20.
//

import UIKit

class NotificationManeger: NSObject {

  func sendNotification(title: String, body: String, delay: TimeInterval) {
    let notificationContent = UNMutableNotificationContent()
    notificationContent.title = title
    notificationContent.body = body

    let date = Date().addingTimeInterval(delay)
    let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)

    var currentBadgeCount = UIApplication.shared.applicationIconBadgeNumber
    currentBadgeCount += 1
    notificationContent.badge = NSNumber(integerLiteral: currentBadgeCount)

    notificationContent.sound = UNNotificationSound.default
    UNUserNotificationCenter.current().delegate = self

    let request = UNNotificationRequest(identifier: "Test", content: notificationContent, trigger: trigger)

    UNUserNotificationCenter.current().add(request) { error in
      if let error = error {
        print(error.localizedDescription)
      }
    }
  }

}

extension NotificationManeger: UNUserNotificationCenterDelegate {

  func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
      completionHandler([.badge, .sound, .alert])
  }

  func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
    let identifier = response.actionIdentifier

    switch identifier {
    case UNNotificationDismissActionIdentifier:
      completionHandler()

    case UNNotificationDefaultActionIdentifier:
      completionHandler()

    default:
      completionHandler()
    }
  }
}
