//
//  Ch6_ViewController2.swift
//  Chapter 06
//
//  Created by 윤태민 on 11/28/21.
//

import UIKit

// MARK:- 6.2.6 미리 알림 기능 구현
import UserNotifications

class Ch6_ViewController2: UIViewController {

    @IBOutlet var message: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func save(_ sender: Any) {
        if #available(iOS 10.0, *) {        // UserNotification 프레임워크 사용
            UNUserNotificationCenter.current().getNotificationSettings { settings in
                if settings.authorizationStatus == UNAuthorizationStatus.authorized {
                    DispatchQueue.main.async {
                        
                        // 1단계: 알림 콘텐츠 객체 만들기(발송할 내용 정의)
                        let nContent = UNMutableNotificationContent()
                        nContent.title = "Reminder"
                        nContent.body = (self.message.text ?? "")
                        nContent.sound = UNNotificationSound.default
                        
                        // 2단계: 알림 발송 조건 정의
                        // - 발송 시각: 직므으로부터 *초
                        let time = self.datePicker.date.timeIntervalSinceNow
                        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: time, repeats: false)
                        
                        // 3단계: 알림 요청 객체 만들기
                        let request = UNNotificationRequest(identifier: "alram", content: nContent, trigger: trigger)
                        
                        // 4단계: 노티피케이션 센터에 추가
                        UNUserNotificationCenter.current().add(request) { _ in
                            // completionHandler
                            DispatchQueue.main.async {
                                // 발송 완료 안내 메시지 창
                                let date = self.datePicker.date.addingTimeInterval(9 * 60 * 60)
                                let message = "Enrolled alram. The alram will be sent at \(date)."
                                let alert = UIAlertController(title: "Enroll Alram", message: message, preferredStyle: .alert)
                                let ok = UIAlertAction(title: "OK", style: .default)
                                alert.addAction(ok)
                                
                                self.present(alert, animated: false)
                            }
                        }
                    }
                }
                else {
                    let alert = UIAlertController(title: "Alert", message: "Deny notification", preferredStyle: .alert)
                    let ok = UIAlertAction(title: "OK", style: .default)
                    alert.addAction(ok)
                    
                    self.present(alert, animated: false)
                    return
                }
            }
        }
        else {                              // LocalNotification 객체 사용
            
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
