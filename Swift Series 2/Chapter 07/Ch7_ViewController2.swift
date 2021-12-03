//
//  Ch7_ViewController2.swift
//  Chapter 07
//
//  Created by 윤태민 on 12/3/21.
//

import UIKit

// MARK:- 7.2 이미지 피커 컨트롤러
class Ch7_ViewController2: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func pick(_ sender: Any) {
        // UIImagePickerController 객체 생성
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        
        // Delegate
        picker.delegate = self
        
        // picker 실행
        self.present(picker, animated: true)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK:- Delegate Methods
extension Ch7_ViewController2: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // 이미지를 선택하지 않고 취소했을 때 호출
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // 명시적으로 호출하는 대상(picker.presentingViewcontroller) 표시
//        picker.presentingViewController?.dismiss(animated: true)
//        self.dismiss(animated: true)
        
        // 자신이 치워야 할 뷰 컨트롤러가 있는지 확인하고, 있으면 치움
//        picker.dismiss(animated: true)
        
        picker.dismiss(animated: true) {
            let alert = UIAlertController(title: "", message: "Cacnel", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel))
            
            self.present(alert, animated: true)
        }
    }
    
    // 이미지를 선택했을 때 호출
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true) {
            let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
            self.imageView.image = image
        }
    }
}
