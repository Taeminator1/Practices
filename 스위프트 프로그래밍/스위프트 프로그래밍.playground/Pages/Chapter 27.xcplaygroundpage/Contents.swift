//: [Home](Untitled%20Page)
//: \
//: [Previous](@previous)

import Foundation

//: ### CHAPTER 27 ARC
/*: 481 p
 
 미소유참조를 하는 프로퍼티가 옵셔널이여도 상관 없는지 확인
 * 옵셔널이나 변수가 아니어도 됨
    * 자신이 참조하는 인스턴스가 항상 메모리에 존재할 것이라는 전제를 기반으로 동작하기 대문에 굳이 옵셔널로 선언할 필요가 없음
 
 */

class Person {
    let name: String
    
    var card: CreditCard?
    
    init(name: String) {
        self.name = name
    }
    
    deinit { print("\(name) is being deinitialized") }
}

class CreditCard {
    let number: UInt
    
//    unowned let owner: Person?
    unowned let owner: Person       // 옵셔널로 선언해도 되지만, CreditCard의 인스턴스는 Person의 인스턴스가 존재해야 함
    
    init(number: UInt, owner: Person) {
        self.number = number
        self.owner = owner
    }
    
    deinit { print("Card #\(number) is being deinitialized") }
}

var person: Person? = Person(name: "A")

if let person: Person = person {
    person.card = CreditCard(number: 1234, owner: person)
}

person = nil


//: [Next](@next)
