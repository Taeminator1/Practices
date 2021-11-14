//: [Home](Untitled%20Page)
//: \
//: [Previous](@previous)

import Foundation

//: ### CHAPTER 11 인스턴스 생성 및 소멸
/*: 232p
 
 실패 가능 이니셜라이저에서 if 문과 guard 문을 통해 초기화 가능한지 확인
 * 둘 다 가능
 
 */

class Person {
    let name: String
    var age: Int?
    
    init?(name: String) {
        // guard 문을 통한 초기화
        guard !name.isEmpty else {
            return nil
        }
        self.name = name
    }
    
    init?(name: String, age: Int) {
        // if 문을 통한 초기화
        if name.isEmpty || age < 0 {
            return nil
        }
        self.name = name
        self.age = age
    }
}

let personA: Person? = Person(name: "A", age: 99)
let personB: Person? = Person(name: "", age: 99)
let personC: Person? = Person(name: "C", age: -1)

print(personA?.name ?? "")      // "A\n"
print(personB?.name ?? "")      // "\n"
print(personC?.name ?? "")      // "\n"

//: [Next](@next)

