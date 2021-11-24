//
//  Ch5_SecondViewController.swift
//  Chapter 05
//
//  Created by 윤태민 on 11/23/21.
//

import UIKit

class Ch5_SecondViewController: UIViewController {

    @IBOutlet var resultEmail: UILabel!
    @IBOutlet var resultUpdate: UILabel!
    @IBOutlet var resultInterval: UILabel!
    
    var paramEmail: String = ""
    var paramUpdate: Bool = false
    var paramInterval: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.resultEmail.text = paramEmail
        self.resultUpdate.text = self.paramUpdate ? "자동 갱신" : "자동 갱신 x"
        self.resultInterval.text = "\(paramInterval)분 마다 갱신"
    }
    
    @IBAction func onBack(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
}
