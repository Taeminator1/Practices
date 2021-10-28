//
//  main.swift
//  CHAPTER 04
//
//  Created by 윤태민 on 10/27/21.
//

import Foundation

// MARK:- High Order Function
// Global function으로 정의할 수도, Array 타입을 확장할 수도 있다.
// 확장을 이용해 정의하는 경우: 더 나은 자동완성, 명확한 이름, 종종 더 분명한 구조의 코드
func map<Element, T>(xs: [Element], transform: (Element) -> T) -> [T] {
    var result: [T] = []
    for x in xs {
        result.append(transform(x))
    }
    return result
}

extension Array {
    func map<T>(transform: (Element) -> T) -> [T] {
        var result: [T] = []
        for x in self {
            result.append(transform(x))
        }
        return result
    }
}

extension Array {
    func filter(isIncluded: (Element) -> Bool) -> [Element] {
        var result: [Element] = []
        for x in self where isIncluded(x) {
            result.append(x)
        }
        return result
    }
}

extension Array {
    func reduce<Result>(initialResult: Result, nextPartialResult: (Result, Element) -> Result) -> Result {
        var result = initialResult
        for x in self {
            result = nextPartialResult(result, x)
        }
        return result
    }
}


var arr: [Int] = [1, 2, 3, 4]
print(arr.map { $0 + 1 })
print(arr.filter { $0 == 1 })
print(arr.reduce(initialResult: 0) { $0 + $1 })
print(arr.reduce(initialResult: 0, nextPartialResult: +))
