//
//  MenuListViewModel.swift
//  RxSwift+MVVM
//
//  Created by 윤태민 on 12/4/21.
//  Copyright © 2021 iamchiwon. All rights reserved.
//

import Foundation
import RxSwift

class MenuListViewModel {
    
    let menus: [Menu] = [
        Menu(name: "메뉴1", price: 300, count: 1),
        Menu(name: "메뉴2", price: 400, count: 4),
        Menu(name: "메뉴3", price: 200, count: 3),
        Menu(name: "메뉴4", price: 100, count: 2),
    ]
    
    // Observable은 데이터를 subscribe할 수 있지만, 데이터를 변경할 수 없음
    // Observable은 값을 넘겨줄 뿐, 외부에서 받아서 넘겨줄 수 없음
    // Subject는 Observable 밖에서 데이터를 조작해서 새로운 데이터를 집어 넣는 것이 가능
    var itemsCount: PublishSubject<Int> = PublishSubject()
    var totalPrice: PublishSubject<Int> = PublishSubject()
}
