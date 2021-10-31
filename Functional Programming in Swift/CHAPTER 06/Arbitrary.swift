//
//  Arbitrary.swift
//  CHAPTER 06
//
//  Created by 윤태민 on 10/29/21.
//

import Foundation

protocol Arbitrary: Smaller {
    // 랜덤을 반환하는 정적 메서드
    static func arbitrary() -> Self
}

// MARK:- Arbitrary 프로토콜을 따르도록 변경
extension Int: Arbitrary {
    func smaller() -> Int? {
        return self == 0 ? nil : self / 2
    }
    
    static func arbitrary() -> Int {
        return Int(arc4random())
    }
    
    static func arbitrary(from: Int, to: Int) -> Int {
        return from + (Int(arc4random()) % (to - from))
    }
}

extension Character: Arbitrary {
    func smaller() -> Character? {
        return nil
    }
    
    static func arbitrary() -> Character {
        return Character(UnicodeScalar(Int.random(in: 65 ... 90))!)
    }
}

extension String: Arbitrary {
    func smaller() -> String? {
        return isEmpty ? nil : String(self.dropFirst())
    }
    
    static func arbitrary() -> String {
        func tabulate<A>(times: Int, transform: (Int) -> A) -> [A] {
        //    return (0 ..< times).map(transform)
            return (0 ..< times).map { transform($0) }
        }
        
        let length = Int.random(in: 0 ... 40)
        let characters = tabulate(times: length) { _ in
            Character.arbitrary()
        }
        
        return String(characters)
    }
}

extension CGSize: Arbitrary {
    func smaller() -> CGSize? {
        return CGSize(width: width / 2, height: height / 2)
    }
    
    static func arbitrary() -> CGSize {
        return CGSize(width: Double(arc4random()) * drand48(), height: Double(arc4random()) * drand48())
    }
    
    var area: CGFloat {
        return width * height
    }
}

// 아래와 같이 작성해도, Array가 Arbitary 프로토콜을 따르도록 확장하는 것은 불가능하다.
// var arr: [Int] = [1, 2, 3]
//print(arr.arbitrary())      // Static member 'arbitary' cannot be used on instance of type '[Int]'
extension Array where Element: Arbitrary {
    func smaller() -> [Element]? {
        guard !isEmpty else { return nil }
        
        return Array(dropFirst())
    }
    
    static func arbitrary() -> Array<Element> {
        let randomLength = Int(arc4random() % 50)
        return tabulate(times: randomLength) { _ in Element.arbitrary() }
    }
}
