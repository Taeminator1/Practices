//
//  ViewController.swift
//  Chapter 05
//
//  Created by 윤태민 on 11/23/21.
//

import UIKit

// MARK:- 5.2 뷰 컨트롤러에 직접 값을 전달하기
class Ch5_ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet var email: UITextField!
    @IBOutlet var isUpdate: UISwitch!
    @IBOutlet var interval: UIStepper!
    
    @IBOutlet var isUpdateText: UILabel!
    @IBOutlet var intervalText: UILabel!
    
    @IBAction func onSwitch(_ sender: UISwitch) {
        self.isUpdateText.text = sender.isOn ? "갱신함" : "갱신하지 않음"
    }
    
    @IBAction func onStepper(_ sender: UIStepper) {
        self.intervalText.text = "\(Int(sender.value))분 마다"
    }
    
    // MARK:- 5.2.1 프레젠테이션 방식으로 화면 전환하면서 값을 전달하기
    @IBAction func onSubmit(_ sender: Any) {
        
        // 데이터를 전달하려는 ViewController의 인스턴스 생성
        // 단순히 화면을 전환하는 것뿐만이 아니라 전환 대상의 프로퍼티를 참조하고 여기에 값을 대입하기 까지 해야 하므로 타입 캐스팅 필요
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "Ch5_SecondViewController") as? Ch5_SecondViewController else {
            return
        }
        
        vc.paramEmail = self.email.text!
        vc.paramUpdate = self.isUpdate.isOn
        vc.paramInterval = self.interval.value
        
        self.present(vc, animated: true)
    }
    
    // MARK:- 5.2.3 세그웨이를 이용하여 화면 전환하면서 값을 전달하기
    @IBAction func onPerformSegue(_ sender: Any) {
        self.performSegue(withIdentifier: "Submit2", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination
        guard let vc = destination as? Ch5_SecondViewController else {
            return
        }
        
        vc.paramEmail = self.email.text!
        vc.paramUpdate = self.isUpdate.isOn
        vc.paramInterval = self.interval.value
    }
}

