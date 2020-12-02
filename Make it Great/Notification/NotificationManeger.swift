//
//  NotificationManeger.swift
//  Make it Great
//
//  Created by Elias Ferreira on 02/12/20.
//

import UIKit

class NotificationManeger: NSObject {

  func sendNotification(title: String, subtitile: String, body: String, badge: Int?, delayInterval: Int?) {
    let notificationContent = UNMutableNotificationContent()
    notificationContent.title = title
    notificationContent.subtitle = subtitile
    notificationContent.body = body

    let delayTimeTrigger: UNTimeIntervalNotificationTrigger?

    if let delay = delayInterval {
      delayTimeTrigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(delay), repeats: false)
    } else {
      delayTimeTrigger = nil
    }

    if let badge = badge {
      var currentBadgeCount = UIApplication.shared.applicationIconBadgeNumber
      currentBadgeCount += badge
      notificationContent.badge = NSNumber(integerLiteral: currentBadgeCount)
    }

    notificationContent.sound = UNNotificationSound.default
    UNUserNotificationCenter.current().delegate = self

    let request = UNNotificationRequest(identifier: "Test", content: notificationContent, trigger: delayTimeTrigger)

    UNUserNotificationCenter.current().add(request) { error in
      if let error = error {
        print(error.localizedDescription)
      }
    }
  }

}

extension NotificationManeger: UNUserNotificationCenterDelegate {

  func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
    completionHandler([.badge, .sound,. alert])
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

