//
//  SecondViewController2.swift
//  Chapter 04
//
//  Created by 윤태민 on 11/18/21.
//

import UIKit

class SecondViewController3: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // 화면 복귀용 메소드를 이용한 Unwind
    // - 프레젠테이션 방식으로 이동했을 때: dismiss(animated:)
    // - 내비게이션 컨트롤러를 이용하여 이동했을 때: popViewController(animated:)
    // Unwind Segue를 이용한 Unwind
    @IBAction func dismiss(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
}
