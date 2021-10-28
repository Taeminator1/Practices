//
//  main.swift
//  CHAPTER 06
//
//  Created by 윤태민 on 10/28/21.
//

import Foundation

protocol Arbitrary {
    static func arbitrary() -> Self
}

extension Int: Arbitrary {
    static func arbitrary() -> Int {
        return Int(arc4random())
    }
}

print(Int.arbitrary())

extension Character: Arbitrary {
    static func arbitrary() -> Character {
        return Character(UnicodeScalar(Int.random(in: 65 ... 90))!)
    }
    
    func smaller() -> Character? { return nil }
}

func tabulate<A>(times: Int, transform: (Int) -> A) -> [A] {
//    return (0 ..< times).map(transform)
    return (0 ..< times).map {
        transform($0)
    }
}

extension Int {
    static func random(from: Int, to: Int) -> Int {
        return from + (Int(arc4random()) % (to - from))
    }
}

extension String: Arbitrary {
    static func arbitrary() -> String {
        let length = Int.random(in: 0 ... 40)
        let characters = tabulate(times: length) { _ in
            Character.arbitrary()
        }
        return String(characters)
    }
}

print(String.arbitrary())
