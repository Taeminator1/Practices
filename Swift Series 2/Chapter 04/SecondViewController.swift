//
//  SecondViewController.swift
//  Chapter 04
//
//  Created by 윤태민 on 11/16/21.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBAction func dismiss(_ sender: Any) {
        // 복귀할 때는 self.present(_:animated:) 메소드가 아닌 dismiss(animated:) 메소드를 사용
        self.presentingViewController?.dismiss(animated: true)
        
        // 내비게이션 컨트롤러에 의해 화면이 전환되었을 때 이전 화면으로 되돌아가는 방법
        self.navigationController?.popViewController(animated: true)
    }
}
