//
//  LocationViewController.swift
//  NetworkBasic
//
//  Created by Mac Pro 15 on 2022/07/29.
//

import UIKit
import UserNotifications

class LocationViewController: UIViewController {

    //Notification 1.
    let notificationCenter = UNUserNotificationCenter.current()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Custom Font
        for family in UIFont.familyNames {
            print("=====\(family)======")

    }
        //Notification 2.
        func requestAuthorization() {

            let authorizationOptions = UNAuthorizationOptions(arrayLiteral: .alert, .badge, .sound)
            notificationCenter.requestAuthorization(options: authorizationOptions) { success, error in
                
                if success {
                    self.sendNotification()
                }
            }
        }
        //Notification 3. 권한 허용한 사용자에게 알림 요청(언제? 어떤 컨텐츠?)
        //iOS시스템에서 알림을 담당 > 알림 등록
        /*
         
         -. 권한허용해야 알림이 온다.
         -. 권한허용문구는 시스템적으로 최초 한번만 뜬다.
         -. 허용안된경우 애플설정으로 직접유도하는 코드를 구성해야한다.
         -. 기본적으로 알림은 포그라운드에 수신되지 않는다.
         -. 로컬알림에서 60초 이상 반복 가능하지만 갯수제한 64개다.
         
         1. 뱃지제거는 언제할까?
         2. 노티유효기간은 언제까지일까? ex.카카오톡
         3. 포그라운드 수신은 어떻게 할까?
         
         +@
         -. 노티는 앱실행이 기본인데 특정 노티를 클릭할때 특정화면으로 가고 싶다면?
         -. 포그라운드 수신, 특정화면에서는 안받고 특정조건에서만 포그라운드 수신을 하고 싶다면?(개인톡하는 중에 개인톡상대방에게 카톡왔을때 노티 안뜨게)
         */
        func sendNotification() {
            let notificationContent = UNMutableNotificationContent()
            
            notificationContent.title = "다마고치를 키워보세요"
            notificationContent.body = "오늘 행운의 숫자는 \(Int.random(in:1...100))"
            notificationContent.body = "저는 따끔 다마고치입니다."
            notificationContent.badge = 40
            
            //언제 보낼것인가? 1. 시간간격 2. 캘린더 3. 위치에 따라 설정 가능
            //repeat false면 60미만 설정 가능, repeat true면 60이상 설정 해야함
            //let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            
            var dateComponent = DateComponents()
            dateComponent.minute = 15
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: true)
            //알림요청
            //identifier: 알림 관리 할 필요 없는 경우 -> 알림클릭하면 앱켜주는 기능정도
            //          알림 관리 필요한 경우 -> +1, 고유이름, 규칙 추가 기능
            let request = UNNotificationRequest(identifier: "\(Date())", content: notificationContent, trigger: trigger)
            
            notificationCenter.add(request)
    }
    

}
    @IBAction func notificationButtonClicked(_ sender: UIButton) {
        let content = sendNotification()
    }
}
