//
//  main.swift
//  CHAPTER 09
//
//  Created by 윤태민 on 11/3/21.
//

import Foundation

//let five: BinarySearchTree<Int> = .Node(.Leaf, 5, .Leaf)
var five = BinarySearchTree<Int>(value: 5)
print(five.count)

//let six: BinarySearchTree<Int> = .Node(.Leaf, 6, five)
var six = BinarySearchTree<Int>(left: five, value: 6)
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

print()

six.insert(3)
six.insert(9)
six.insert(8)
six.insert(1)

print(six.inorderElements)
print(five.inorderElements)
