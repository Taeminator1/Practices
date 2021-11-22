//
//  NewSegue.swift
//  Chapter 04
//
//  Created by 윤태민 on 11/22/21.
//

import UIKit

class NewSegue5: UIStoryboardSegue {
    
    override func perform() {
        // 세그웨이의 출발지 뷰 컨트롤러
        let sourceUVC = self.source
        
        // 세그웨이의 목적지 뷰 컨트롤러
        let destinationUVC = self.destination
        
        UIView.transition(from: sourceUVC.view,
                          to: destinationUVC.view,
                          duration: 2,
                          options: .transitionCurlDown)
        
    }
}
