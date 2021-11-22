//
//  ViewController5.swift
//  Chapter 04
//
//  Created by 윤태민 on 11/22/21.
//

import UIKit

class ViewController5: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        NSLog("segueway identifer: \(segue.identifier!)")
    }
}
