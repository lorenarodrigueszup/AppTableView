//
//  Notification.swift
//  TableView
//
//  Created by Lorena Rodrigues Bruno on 03/10/2018.
//  Copyright © 2018 Lorena Rodrigues Bruno. All rights reserved.
//

import UIKit
import UserNotifications

class Notification: NSObject {
    
    static let shared = Notification()
    private override init() {}
    
    // MARK: - Static Methods
    
    static func schedulePushNotification(_ task: Task){
        shared.schedulePushNotification(task)
    }
    
    static func authorization() {
        shared.authorization()
    }
    
    static func checkAuthorization() {
        shared.checkAuthorization()
    }
    
    static func deleteNotification(notificationId: String) {
        shared.deleteNotification(notificationId: notificationId)
    }
    
    // MARK: - Methods
    
    func authorization() {
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        let options: UNAuthorizationOptions = [.alert, .badge]
        center.requestAuthorization(options: options) { (sucess, error) in
            if !sucess {
                self.checkAuthorization()
            }
        }

    }
    
    // MARK: - Notification
    
    func checkAuthorization() {
        let alertController = UIAlertController(title: "Alerta", message: "Para receber alertas deste aplicativo, é preciso ativar a permissão de notificação.", preferredStyle: .alert)

        let settingsAction = UIAlertAction(title: "Ativar permissão", style: .default) { (_) -> Void in
            guard let settingsUrl = URL(string: UIApplicationOpenSettingsURLString) else {
                return
            }
            
            if UIApplication.shared.canOpenURL(settingsUrl) {
                UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                })
            }
        }
        
        alertController.addAction(settingsAction)
        let cancelAction = UIAlertAction(title: "Cancelar", style: .default){ (_) -> Void in
        }
        alertController.addAction(cancelAction)
        
        guard let viewController = UIApplication.shared.keyWindow?.rootViewController else { return }
        viewController.present(alertController, animated: true, completion: nil)
    }

    
    func schedulePushNotification(_ task: Task){
        let content = UNMutableNotificationContent()
        content.title = "Next schedule task"
        content.body = "\(task.nameTask) - \(task.hour)"
        
        
        let calendar = Calendar.current
        let day = calendar.component(.day, from: task.date)
        let month = calendar.component(.month, from: task.date)
        let year = calendar.component(.year, from: task.date)
        
        let hour = calendar.component(.hour, from: task.timeFromString(timeString: task.hour))
        let minute = calendar.component(.minute, from: task.timeFromString(timeString: task.hour))
        
        var dateComponents = DateComponents()
        dateComponents.day = day
        dateComponents.month = month
        dateComponents.year = year
        
        dateComponents.hour = hour
        dateComponents.minute = minute
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString,
                                            content: content, trigger: trigger)
        //print("ScheduleTask: \(task.nameTask) with identifier: \(uuidString)")
        task.notificationId = uuidString
        
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.add(request) { (error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            
        }
        
        
    }
    

    
    func deleteNotification(notificationId: String ) {
        UNUserNotificationCenter.current().getPendingNotificationRequests { (notificationRequests) in
            var identifiers: [String] = []
            for notification:UNNotificationRequest in notificationRequests {
                if notification.identifier == notificationId {
                    identifiers.append(notification.identifier)
                }
            }
            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: identifiers)
        }
        
    }
    
}

extension Notification: UNUserNotificationCenterDelegate {

    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        completionHandler([.alert, .badge])
        
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
    }

}

