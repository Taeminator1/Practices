//
//  CustomSet.swift
//  CHAPTER 09
//
//  Created by 윤태민 on 11/3/21.
//

import Foundation

// MARK:- Array를 이용한 집합 구현
// - 단순하게 구현 가능
// - 집합의 크기에 비례하여 실행
struct CustomSet<T: Equatable> {
    var elements: [T] = []
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    func contains(_ x: T) -> Bool {
        return elements.contains(x)
    }
    
    mutating func insert(_ x: T) {
        if !contains(x) {
            elements.insert(x, at: 0)
        }
    }
}
