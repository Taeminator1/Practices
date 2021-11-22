//
//  ViewController2.swift
//  Chapter 04
//
//  Created by 윤태민 on 11/18/21.
//

import UIKit

class ViewController3: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func presentModally(_ sender: Any) {
        self.performSegue(withIdentifier: "PresentModally", sender: self)
    }
}
