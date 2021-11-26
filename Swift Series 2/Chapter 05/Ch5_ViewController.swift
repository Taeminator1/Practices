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
    
    // MARK:- 5.3.2 저장소를 사용하여 값을 주고 받기
    @IBAction func onSubmit2(_ sender: Any) {
        // AppDelegate의 인스턴스를 참조하는 방법
        // - AppDelegate는 앱 전체를 통틀어 하나의 인스턴스만 존재하도록 보장하는 싱글톤이다.
        // - 따라서 AppDelegate 클래스의 인스턴스는 직접 생성할 수 없고,
        // - UIApplication.shared.delegate 구문을 통해 생성되어 있는 인스턴스를 참조해야 한다.
        _ = UIApplication.shared.delegate as? AppDelegate
        
        // UserDefaults 객체를 사용하여 값 저장
        let ud = UserDefaults.standard
        
        // 값 저장
        ud.set(self.email.text, forKey: "email")
        
        // 값 조회
        ud.string(forKey: "email")
        
    }
}

