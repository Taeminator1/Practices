//
//  main.swift
//  CHAPTER 09
//
//  Created by 윤태민 on 11/3/21.
//

import Foundation

//let five: BinarySearchTree<Int> = .Node(.Leaf, 5, .Leaf)
let five = BinarySearchTree<Int>(value: 5)
print(five.count)

//let six: BinarySearchTree<Int> = .Node(.Leaf, 6, five)
let six = BinarySearchTree<Int>(left: five, value: 6)
print(six.count)


print(six.inorderElements)
print(five.inorderElements)

let empty: BinarySearchTree<Int> = .Leaf
print(six.isEmpty)
print(five.isEmpty)
print(empty.isEmpty)

//var arr: [Int] = []
//arr.contains(<#T##element: Int##Int#>)
//arr.insert(<#T##newElement: Int##Int#>, at: <#T##Int#>)

print()

print(six.contains(5))
print(six.contains(6))
print(six.contains(7))

print(five.contains(4))
print(five.contains(5))
print(five.contains(6))

