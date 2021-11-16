//
//  ViewController.swift
//  Chapter 04
//
//  Created by 윤태민 on 11/14/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func moveNext(_ sender: Any) {
        // Bundle.main에 포함되어 있는 스토리보드 참조
//        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // Deplyment Info의 Main Interface를 참조
        let storyboard = self.storyboard
        
        // 이동할 뷰 컨트롤러 객체를 StoryboardID 정보를 이용하여 참조.
        guard let uvc = storyboard?.instantiateViewController(identifier: "SecondVC") else {
            return
        }
        
        // 이동할 화면의 스타일 설정
        uvc.modalPresentationStyle = .fullScreen
        
        // 화면 전환할 때의 애니메이션 타입
//        uvc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        uvc.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
//        uvc.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
//        uvc.modalTransitionStyle = UIModalTransitionStyle.partialCurl
        
        // 인자값으로 뷰 컨트롤러 인스턴스를 넣고 프레젠트 메소드 호출
        // 화면 전환은 화면 자체가 교체되는 것이 아니라 기존의 화면이 있는 상태에서 새로운 화면이 그 위를 덮는 형태
        self.present(uvc, animated: true)
    }
}
