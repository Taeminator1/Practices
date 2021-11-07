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
    case Node(left: BinarySearchTree<T>, value: T, right: BinarySearchTree<T>)
}

extension BinarySearchTree {
    init() {
        self = .Leaf
    }
    
    init(left: BinarySearchTree<T> = .Leaf, value: T, right: BinarySearchTree<T> = .Leaf) {
        switch left {
        case .Leaf:
            break
        case let .Node(_, leftValue, _):
            if leftValue >= value {
                fatalError()
            }
        }
        
        switch right {
        case .Leaf:
            break
        case let .Node(_, rightValue, _):
            if value >= rightValue {
                fatalError()
            }
        }
        
        self = .Node(left: left, value: value, right: right)
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

extension BinarySearchTree {
    mutating func insert(_ newElement: T) {
    }
    
    func contains(_ element: T) -> Bool {
        switch self {
        case .Leaf:
            return false
        case let .Node(_, value, _) where element == value:
            return true
        case let .Node(left, value, _) where element < value:
            return left.contains(element)
        case let .Node(_, value, right) where element > value:
            return right.contains(element)
        default:
            fatalError("abc")
        }
    }
}
