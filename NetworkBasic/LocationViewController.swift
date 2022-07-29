//
//  LocationViewController.swift
//  NetworkBasic
//
//  Created by Mac Pro 15 on 2022/07/29.
//

import UIKit
import UserNotifications
 
class LocationViewController: UIViewController {

    //Notification 1. Local Notification 담당 클래스 가져와서 인스턴스 선언하기(UNUserNotificationCenter.current())
    //UNUserNotificationCenter에서 UN은 User Notification
    let notificationCenter = UNUserNotificationCenter.current()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //권한요청, 등록코드를 viewDidLoad에 호출해야 한다.
        
        
        //Custom Font: 폰트이름 확인용도로 사용
        for family in UIFont.familyNames {
            print("=====\(family)======")
            
            for name in UIFont.fontNames(forFamilyName: family) {
                print(name)
            }
        }

    }
        //Notification 2. 권한 요청하는 기능 위한 함수 구현하기
        func requestAuthorization() {
            
            let authorizationOptions = UNAuthorizationOptions(arrayLiteral: .alert, .badge, .sound) // 권한 요청 내용을 배열로 선언
            notificationCenter.requestAuthorization(options: authorizationOptions) { success, error in
                //notificationCenter 인스턴스로 접근하여 권한요청 기능 추가
                //options: 무엇에 대한 권한을 설정할지 작성하는 부분(ex. alert인지, badge인지 등)
                //클로저부분을 권한 요청 성공, 실패 키워드로 구분하고 조건문 작성
                
                if success {
                    self.sendNotification()
                    //함수안에 함수가 있기 때문에 self키워드 붙임(해당 클래스에 대한 인스턴스가 가지고 있는 함수를 요청해달라는 의미)
                }
            }
        }
    
        //Notification 3. 권한 허용한 사용자에게 알림 보내는 기능 위한 함수 구현하기(어떤 컨텐츠를 언제 보낼지에 대한 내용 포함)
        //N2+sendNotification함수까지만 하고 빌드하면 화면에 아무것도 뜨지 않는다. 화면에 표시하기 위해서는 알림을 담당하는 iOS시스템에 알림 등록을 해줘야 한다.
        /*
         #알림설정 포인트#
         -. 권한허용해야 알림이 온다.
         -. 권한허용문구는 시스템적으로 최초 한번만 뜬다. 그러므로 허용 안 된 경우 애플설정으로 직접유도하는 코드를 구성해야 한다.
         -. 기본적으로 알림은 포그라운드에 수신되지 않는다. 그러므로 AppDelegate에 따로 코드 구성해야 한다.
         -. 로컬알림에서 60초 이상 반복 가능하지만 갯수제한 64개다.
         
         1. 뱃지제거는 언제/어떻게 할까? SceneDelegate-SceneDidBecomeActive에서 UIApplication.shared.applicationIconBadgeNumber = 0 추가
         2. 노티유효기간은 언제까지일까? 기본적으로는 한 달정도. ex.푸시 열면 한번에 사라지는 예시: 카카오톡
         application(didFinishLaunchingWithOptions)에서 UNUserNotificationCenter.current().removeAllPendingNotificationRequests(), UNUserNotificationCenter.current().delegate = self 추가
         3. 포그라운드 수신은 어떻게 할까?
         class AppDelegate: UIResponder에 UIApplicationDelegate, UNUserNotificationCenterDelegate 추가
         func userNotificationCenter(willPresent)에 completionHandler([.list, .banner, .badge, .sound])추가
         
         
         +@
         -. 노티는 앱실행이 기본인데 특정 노티를 클릭할때 특정화면으로 가고 싶다면?(ex. 신발광고 누르면 신발구매페이지 이동)
         -. 포그라운드 수신, 특정화면에서는 안받고 특정조건에서만 포그라운드 수신을 하고 싶다면?(개인톡하는 중에 개인톡상대방에게 카톡왔을때 노티 안뜨게)
         -. 텍스트필드에서 .textContentType = .oneTimeCode하면 인증번호 자동입력 구현가능
         
         */
        func sendNotification() {
            let notificationContent = UNMutableNotificationContent()
            
            //어떤 컨텐츠를 보낼지 내용 작성
            notificationContent.title = "다마고치를 키워보세요"
            notificationContent.subtitle = "오늘 행운의 숫자는 \(Int.random(in:1...100))"
            notificationContent.body = "저는 따끔 다마고치입니다."
            notificationContent.badge = 40
            
            //언제 보낼지 내용 작성 (1. 시간간격 2. 캘린더 3. 위치에 따라 설정 가능)
            //repeat false면 60미만 설정 가능, repeat true면 60이상 설정 해야함.
            //시간단위 알림
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
            
            var dateComponent = DateComponents()
            dateComponent.minute = 10
            
            //특정시간 알림
            //let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: true)
            
            //알림 요청용 객체 생성(내용, 시간 알림을 담아서 요청 보낼 객체)
            //identifier는 알림창개수라고 생각하면 됨. identifier이 하나면 계속 발송되는 알림을 하나의 창으로 표시한다는 의미이므로 내용이 계속 바뀔 것임.
            //identifier는 경우에 따라 관리 방식이 다름.
            //알림 클릭했을 때 앱실행만 하는 경우 : 날짜로 적용해줘도 무방함. 날짜가 중복되는 경우는 많지 않기 때문.
            //알림 클릭했을 때 특정 기능이 실행되는 경우(A에게 온 카톡알림을 눌렀을 때 A채팅방으로 가야하는데 B채팅방 가면 안됨) : 알림 올때마다 count +1로 적용해주는게 좋음.
            //identifier: ,content: content용으로 만든 변수 넣기, trigger: trigger용 변수 넣기
            let request = UNNotificationRequest(identifier: "\(Date())", content: notificationContent, trigger: trigger)
            
            //iOS시스템에 알림등록 요청하기
            notificationCenter.add(request)
    }
    
    @IBAction func notificationButtonClicked(_ sender: UIButton) {
        requestAuthorization()
    }
    
}

//앱이 꺼져있는 상태에서도 시간,날짜는 계속 갱신됨

/*
xcode에 폰트 추가시 주의점
 
 1. 저작권
 2. 용량 : 폰트파일 용량이 크면 앱크기 자체도 커지기 때문에 용량 체크 필요.
 3. info.plist 폰트등록 : 파일이름과 폰트이름이 불일치 할 수 있기 때문에 폰트이름 등록 필요.
*/
