//
//  main.swift
//  CHAPTER 11
//
//  Created by 윤태민 on 11/29/21.
//

import Foundation

print("Hello, World!")

// MARK:- Genarator Type: Generator를 정의하기 위한 추상화 프로토콜 정의
// - 제네레이터는 반복적으로 다음 요소를 계산하기 위한 일회성 메커니즘
// - 타입을 구성하는 연관 타입 정의
// - 다음 원소를 가리키는 next() 메소드 정의
protocol GeneratorType {
    associatedtype Element
    func next() -> Element?
}

extension GeneratorType {
    mutating func find(predicate: (Element) -> Bool) -> Element? {
        while let x = self.next() {
            if predicate(x) {
                return x
            }
        }
        return nil
    }
}

// MARK:- Some Generator
class CountdownGenerator: GeneratorType {
    var element: Int
    
    init<T>(array: [T]) {
        self.element = array.count
    }
    
    func next() -> Int? {
        element -= 1
        
        return element < 0 ? nil : element
    }
}

let chars: [Character] = ["A", "B", "C"]
var generator = CountdownGenerator(array: chars)
while let i = generator.next() {
    print("Element \(i) of the array is \(chars[i])")
}

generator = CountdownGenerator(array: chars)
print(generator.find() { chars[$0] == "A" } ?? "")

generator = CountdownGenerator(array: chars)
print(generator.find() { chars[$0] == "B" } ?? "")

generator = CountdownGenerator(array: chars)
print(generator.find() { chars[$0] == "C" } ?? "")

// MARK:- Sequence Type
// - 제네레이터의 일회성 특성을 보완
protocol SequenceType {
    associatedtype Generator: GeneratorType         // GeneratorType을 따르는 클래스에 대한 연관 타입 선언
    func generate() -> Generator
}

struct ReverseSequence<T>: SequenceType {
    var array: [T]
    
    init(array: [T]) {
        self.array = array
    }
    
    func generate() -> some GeneratorType {         // 반환값이 Generator를 따르는 어떤 타입
        return CountdownGenerator(array: array)
    }
}

let reverseSequence = ReverseSequence(array: chars)
let reverseGenerator = reverseSequence.generate()   // 제네레이터를 생성하기 위해 generate() 호출

while let i = reverseGenerator.next() {
    print("Index \(i) is \(chars[i as! Int])")
}

// Swift에 정의되어 있는 Sequence 프로토콜 이용 가능
struct Countdown: Sequence, IteratorProtocol {
    var count: Int

    mutating func next() -> Int? {
        if count == 0 {
            return nil
        } else {
            defer { count -= 1 }
            return count
        }
    }
}

let threeToGo = Countdown(count: 3)
for i in threeToGo {
    print(i)
}
