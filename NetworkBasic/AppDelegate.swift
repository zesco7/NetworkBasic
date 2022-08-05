//
//  AppDelegate.swift
//  NetworkBasic
//
//  Created by Mac Pro 15 on 2022/07/27.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //2. 노티제거
        //알람앱미리알림 스케줄할일목록-> 하루전 알림, 30분전 알림 등 예정알림도 삭제해줌
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        
        //delegate연결해줘야됨.
        UNUserNotificationCenter.current().delegate = self
        return true
    }
    
    //애플이 시스템으로 만든 함수기 때문에 호출하지 않아도 자동실행됨.
    //userNotificationCenter메서드 구현하지 않으면 foreground상태에서 안보임(foreground 수신용)
    //foreground에서 어떤걸 허용해줄지 completionHandler를 배열형태로 작성
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.list, .banner, .badge, .sound])
        //iOS14 이후부터는 .alert 대신 .list, .banner
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

