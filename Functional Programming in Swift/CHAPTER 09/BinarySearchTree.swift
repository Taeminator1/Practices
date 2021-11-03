//
//  BinarySearchTree.swift
//  CHAPTER 09
//
//  Created by 윤태민 on 11/3/21.
//

import Foundation

// MARK:- enum을 이용한 집합 구현
// - indirect 키워드를 사용하여 재귀적으로 정의 가능
indirect enum BinarySearchTree<T: Comparable> {
    case Leaf
    case Node(BinarySearchTree<T>, T, BinarySearchTree<T>)
}

extension BinarySearchTree {
    init(_ value: T) {
        self = .Node(.Leaf, value, .Leaf)
    }
    
    init() {
        self = .Leaf
    }
}

extension BinarySearchTree {
    var count: Int {
        switch self {
        case .Leaf:
            return 0
        case let .Node(left, _, right):
            return 1 + left.count + right.count
        }
    }
    
    var inorderElements: [T] {
        switch self {
        case .Leaf:
            return []
        case let .Node(left, value, right):
            return left.inorderElements + [value] + right.inorderElements
        }
    }
    
    var isEmpty: Bool {
        if case .Leaf = self {
            return true
        }
        return false
    }
}
