//
//  ViewController2.swift
//  Chapter 04
//
//  Created by 윤태민 on 11/18/21.
//

import UIKit

// MARK:- 4.5.2 매뉴얼 세그웨이
// MARK:- 4.5.3 Unwind - 화면 복귀
class ViewController3: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // 매뉴얼 세그웨이는 트리거 없이 수동으로 실행해야 하므로 소스 코드에서 세그웨이를 실행할 메소드를 호출해야 합니다.
    @IBAction func presentModally(_ sender: Any) {
        self.performSegue(withIdentifier: "PresentModally", sender: self)
    }
}
