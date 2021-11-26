//
//  ViewController.swift
//  Chapter 06
//
//  Created by 윤태민 on 11/26/21.
//

import UIKit

// MARK:- 6.1 메시지 알림창 - UIAlertController
class Ch6_ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet var result: UILabel!
    
    @IBAction func onAlert(_ sender: Any) {
        // 메세지 창 객체 생성(alert)
        let alert = UIAlertController(title: "선택", message: "항목을 선택해주세요", preferredStyle: .alert)
        
        // 메세지 창을 구성하는 버튼 객체 생성
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel) { _ in self.result.text = "alert - cancel" }
        let defaultAction = UIAlertAction(title: "default", style: .default) { _ in self.result.text = "alert - default" }
        let destructiveAction = UIAlertAction(title: "destructive", style: .destructive) { _ in self.result.text = "alert - destructive" }
        
        alert.addAction(cancelAction)
        alert.addAction(defaultAction)
        alert.addAction(destructiveAction)
        
        self.present(alert, animated: true)
    }
    
    @IBAction func onActionSheet(_ sender: Any) {
        // 메세지 창 객체 생성(actionSheet)
        let alert = UIAlertController(title: "선택", message: "항목을 선택해주세요", preferredStyle: .actionSheet)
        
        // 메세지 창을 구성하는 버튼 객체 생성
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel) { _ in self.result.text = "actionSheet - cancel" }
        let defaultAction = UIAlertAction(title: "default", style: .default) { _ in self.result.text = "actionSheet - default" }
        let destructiveAction = UIAlertAction(title: "destructive", style: .destructive) { _ in self.result.text = "actionSheet - destructive" }
        
        alert.addAction(cancelAction)
        alert.addAction(defaultAction)
        alert.addAction(destructiveAction)
        
        self.present(alert, animated: true)
    }
}

