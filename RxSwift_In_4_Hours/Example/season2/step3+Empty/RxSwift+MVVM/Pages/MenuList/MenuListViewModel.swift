//
//  MenuListViewModel.swift
//  RxSwift+MVVM
//
//  Created by 윤태민 on 12/4/21.
//  Copyright © 2021 iamchiwon. All rights reserved.
//

import Foundation

class MenuListViewModel {
    let menus: [Menu] = [
        Menu(name: "메뉴1", price: 300, count: 1),
        Menu(name: "메뉴2", price: 400, count: 4),
        Menu(name: "메뉴3", price: 200, count: 3),
        Menu(name: "메뉴4", price: 100, count: 2),
    ]
}
