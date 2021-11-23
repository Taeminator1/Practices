//
//  ViewController5.swift
//  Chapter 04
//
//  Created by 윤태민 on 11/22/21.
//

import UIKit

// MARK:- 4.5.4 커스텀 세그웨이
class ViewController5: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // 4.5.5 전처리 메소드의 활용
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        NSLog("segueway identifer: \(segue.identifier!)")
    }
}
