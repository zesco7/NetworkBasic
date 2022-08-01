//
//  1NotiViewController.swift
//  NetworkBasic
//
//  Created by Mac Pro 15 on 2022/07/30.
//

import UIKit

class _NotiViewController: UIViewController {

    let notificationCenter = UNUserNotificationCenter.current()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        requestAuthorization()
        
    }
    
    func requestAuthorization() {
        let authorizationOptions = UNAuthorizationOptions(arrayLiteral: .alert, .badge, .badge)
        notificationCenter.requestAuthorization(options: authorizationOptions) { success, error in
            
            if success {
                self.sendNotification()
            
            }
        }
    }
    func sendNotification(){
        let notificationContent = UNMutableNotificationContent()
        
        notificationContent.title = "안녕"
        notificationContent.subtitle = "내이름은 코난"
        notificationContent.body = "탐정이지"
        notificationContent.badge = 40
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let request = UNNotificationRequest(identifier: "\(Date())", content: notificationContent, trigger: trigger)
        
        notificationCenter.add(request)
    }

    @IBAction func sendNotiBtn(_ sender: UIButton) {
        requestAuthorization()
    }
    
}
