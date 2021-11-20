//: [Home](Untitled%20Page)
//: \
//: [Previous](@previous)

import Foundation

//: ### CHAPTER 15 맵, 필터, 리듀스
/*: 295 p
 
 매개변수에 따른 reduce 함수 차이 확인:
 
    func reduce<Result>(_ initialResult: Result, _ nextPartialResult: (Result, Int) throws -> Result) rethrows -> Result
    func reduce<Result>(into initialResult: Result, _ updateAccumulatingResult: (inout Result, Int) throws -> ()) rethrows -> Result
 
 
 * 두 번째 리듀스 형태는 첫 번재 리듀스 형태와 달리  내부에서 직접 이전 (inout Result)값을 변경한다.
 
 */

let numbers: [Int] = [1, 2, 3, 4, 5 ,6]
print(numbers.reduce(0) { $0 + $1 })                                        // "21\n"
print(numbers.reduce(into: 0, { (result: inout Int, next: Int) in           // "21\n"
    result += next
}))
print(numbers.reduce(into: 0, { result, next in                             // "21\n"
    result += next
}))
print(numbers.reduce(into: 0) { $0 += $1 })                                 // "21\n"

// result라는 매개변수를 직접 변경 가능
print(numbers.reduce(into: []) { (result: inout [Int], next: Int) in        // "[4, 8, 12]\n"
    guard next % 2 == 0 else { return }
    result.append(next * 2)
})

// $0의 값을 직접 변경 가능
print(numbers.reduce(into: []) {                                            //"[4, 8, 12]\n"
    guard $1 % 2 == 0 else { return }
    $0.append($1 * 2)
})

//: [Next](@next)
