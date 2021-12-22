//
//  DetailViewController.swift
//  MyMovieChart
//
//  Created by 윤태민 on 12/22/21.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet var wv: WKWebView!
    var mvo: MovieVO!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = self.mvo.title
        
        let url = URL(string: (self.mvo.detail)!)
        let req = URLRequest(url: url!)
        
        self.wv.load(req)
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
