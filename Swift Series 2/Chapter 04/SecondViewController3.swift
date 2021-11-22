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
    
    @IBAction func dismiss(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
}
