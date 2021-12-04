//
//  AppDelegate.swift
//  Chapter 06
//
//  Created by 윤태민 on 11/26/21.
//

import UIKit

// MARK:- 6.2 로컬 알림
import UserNotifications

@main
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // 알림 설정에 대한 사용자 동의를 반드시 앱 시작 시점에 받을 필요는 없지만, 대부분의 경우에서 앱이 처음 실행될 대 동의를 받습니다.
        if #available(iOS 10.0, *) {        // iOS 10.0 이상 부터 사용 가능
        // 경고창, 배지, 사운드를 사용하는 알림 환경 정보를 생성하고, 사용자 동의 여부 창을 실행
            let notificationCenter = UNUserNotificationCenter.current()
            notificationCenter.requestAuthorization(options: [.alert, .badge, .sound]) { (didAllow, e) in }
            
            // 알림 센터와 관련하여 뭔가 사건이 발생하면 앱 델리게이트에게 알려준다.
            notificationCenter.delegate = self
        }
        else {
            
        }
    
        return true
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

// MARK:- 6.2.3 받은 알림 처리하기
extension AppDelegate {
    // 앱이 실행 도중 알림 메세지 도착한 경우
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        print(NSLocalizedString("1", comment: ""))
        
        if notification.request.identifier == "wakeup" {
            let userInfo = notification.request.content.userInfo
            print(userInfo["name"] ?? "")
        }
        
        completionHandler([.banner, .list, .badge, .sound])
    }
    
    // 사용자가 알림 메시지를 클릭했을 경우
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        print("2")
        
        if response.notification.request.identifier == "wakeup" {
            let userInfo = response.notification.request.content.userInfo
            print(userInfo["name"] ?? "")
        }
        
        if response.notification.request.identifier == "alram" {
            print("alram")
        }
        
        completionHandler()
    }
}
