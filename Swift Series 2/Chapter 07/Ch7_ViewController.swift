//
//  ViewController.swift
//  Chapter 07
//
//  Created by 윤태민 on 12/2/21.
//

import UIKit

// MARK:- 7.1 텍스트 필드
class Ch7_ViewController: UIViewController {

    @IBOutlet var tf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // UITextField 객체의 속성 설정
        tf.placeholder = "Input"
        tf.keyboardType = .alphabet
        tf.keyboardAppearance = .dark
        tf.returnKeyType = .join
        tf.enablesReturnKeyAutomatically = true
        tf.clearButtonMode = .always
        
        // UITextField 객체의 스타일 설정
        tf.borderStyle = .line
        tf.backgroundColor = UIColor(white: 0.87, alpha: 1.0)
        tf.contentVerticalAlignment = .center
        tf.contentHorizontalAlignment = .center
        tf.layer.borderColor = UIColor.darkGray.cgColor
        tf.layer.borderWidth = 2.0
        
        // FirstResonder
        tf.becomeFirstResponder()
        
        // Delegate
        tf.delegate = self
        
    }

    @IBAction func confirm(_ sender: Any) {
        tf.resignFirstResponder()
    }
    
    @IBAction func Input(_ sender: Any) {
        tf.becomeFirstResponder()
    }
}

// Delegate 프로토콜에 optional func로 선언되어 있는 다양한 메소드를 정의할 수 있음
extension Ch7_ViewController: UITextFieldDelegate {
    // 편집을 시작할 때 호출
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("1. textFieldShouldBeginEditing")
        return true
    }
    
    // 편집이 시작된 후 호출
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("2. textFieldDidBeginEditing")
    }
    
    // 내용이 삭제될 때 호출
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("3. textFieldShouldClear")
        return true
    }
    
    // 내용이 변경될 때 호출
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("4. textField")

        // 입력을 숫자로 한정
        guard let _ = Int(string) else {
            return false
        }
        
        return true
    }
    
    // 리턴키가 눌러졌을 때 호출
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("5. textFieldShouldReturn")
        return true
    }
    
    // 편집이 종료될 때 호출
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("6. textFieldShouldEndEditing")
        return true
    }
    
    // 편집이 종료되었을 때 호출
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("7. textFieldDidEndEditing")
    }
    
}
