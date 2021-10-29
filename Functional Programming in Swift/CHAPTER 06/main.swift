//
//  main.swift
//  CHAPTER 06
//
//  Created by 윤태민 on 10/28/21.
//

import Foundation

print(Int.arbitrary())

print(String.arbitrary())


func check1<T: Arbitrary>(numberOfIterations: Int = 100, message: String, property: (T) -> Bool) -> () {
    for _ in 0 ..< numberOfIterations {
        let value = T.arbitrary()
        guard property(value) else {
            print("\(message) doesn't hold: \(value)")
            return
        }
    }
    print("\(message) passed \(numberOfIterations) tests.")
}

check1(message: "Area should be at least 0") { (size: CGSize) in
    size.area >= 0
}

check1(message: "Every string starts with Hello") { (s: String) in
    s.hasPrefix("Hello")
}


func iterateWhile<T>(_ condition: (T) -> Bool, initialValue: T, _ next: (T) -> T?) -> T {
    if let x = next(initialValue), condition(x) {
        return iterateWhile(condition, initialValue: initialValue, next)
    }
    return initialValue
}

func check2<T: Arbitrary>(numberOfIterations: Int = 2, message: String, property: (T) -> Bool) -> () {
    for _ in 0 ..< numberOfIterations {
        let value = T.arbitrary()
        guard property(value) else {
//            let smallerValue = iterateWhile({ !property($0) }, initialValue: value) { $0.smaller() }
            
            var smallerValue = value
            while let tmpValue = smallerValue.smaller() {
                smallerValue = tmpValue
            }
            
            print("\(message) doesn't hold: \(smallerValue)")
            return
        }
    }
    print("\(message) passed \(numberOfIterations) tests.")
}

check2(message: "Area should be at least 0") { (size: CGSize) in
    size.area >= 0
}

check2(message: "Every string starts with Hello") { (s: String) in
    s.hasPrefix("Hello")
}

check2(message: "Unsigned integer should be at least 0") { $0 >= 10000000000 }
