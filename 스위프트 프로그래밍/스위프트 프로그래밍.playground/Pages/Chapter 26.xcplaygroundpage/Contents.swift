//: [Home](Untitled%20Page)
//: \
//: [Previous](@previous)

import Foundation

//: ### CHAPTER 25 패턴
/*: 470p
 
 where 절을 활용한 제니릭 타입의 연관 타입 제약을 추가하는 방법
 * 제네릭 타입을 특정 Protocol을 따르도록 하고 싶을 때는 ":" 사용
 * 제네릭 타입을 특정 Struct의 인스턴스로 제한하고 싶을 때는 "==" 사용
 
 */

protocol ProtocolA {
    func function1()
}

protocol ProtocolB {
    func function2()
}


protocol ProtocolC { }
struct StructA: ProtocolC { }

protocol ProtocolD { }
struct StructB: ProtocolD { }


extension Array: ProtocolA where Element: ProtocolC {
    func function1() {
        print("This functions should be called from Array consist of elements conforming ProtocolC")
    }
}

extension Array: ProtocolB where Element == StructB {
    func function2() {
        print("This functions should be called from Array consist of instances from StructB")
    }
}

let a: [StructA] = []
let b: [StructB] = []

a.function1()
b.function2()

//: [Next](@next)
