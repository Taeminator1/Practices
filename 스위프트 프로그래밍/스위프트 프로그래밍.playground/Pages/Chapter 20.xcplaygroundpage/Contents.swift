//: [Home](Untitled%20Page)
//: \
//: [Previous](@previous)

import Foundation

//: ### CHAPTER 20 프로토콜
/*: 373 p
 
 프로토콜에서 프로퍼티에 대해 요구하는 방식에 따른 구현 방법:
 * get
    * 변수 또는 상수 저장 프로퍼티
    * 읽기/쓰기 또는 읽기만 가능한 연산 프로퍼티
 * get, set
    * 변수 저장 프로퍼티
    * 읽기/쓰기가 가능한 연산 프로퍼티
 
 */

protocol Protocol1 {
    var readOnlyProperty: String { get }
    var readWriteProperty: String { get set }
}

struct Struct1: Protocol1 {
    // MARK:- readOnlyProperty
    var readOnlyProperty: String = ""           // 변수 저장 프로퍼티 가능
    
//    let readOnlyProperty: String                // 상수 저장 프로퍼티 가능
    
//    var readOnlyProperty: String {              // 읽기/쓰기가 가능한 연산 프로퍼티 가능
//        get {
//            return ""
//        }
//        set {
//            self.readWriteProperty + newValue
//        }
//    }

//    var readOnlyProperty: String {              // 읽기 전용 연산 프로퍼티 가능
//        get {
//            return ""
//        }
//    }
    
    // MARK:- readWriteProperty
    var readWriteProperty: String = ""          // 변수 저장 프로퍼티 가능
    
//    let readWriteProperty: String               // let을 통한 상수 저장 프로퍼티 불가
    
//    var readWriteProperty: String {             // 읽기/쓰기가 가능한 연산 프로퍼티 가능
//        get {
//            return ""
//        }
//        set {
//            self.readWriteProperty + newValue
//        }
//    }

//    var readWriteProperty: String {             // 읽기 전용 연산 프로퍼티 불가
//        get {
//            return ""
//        }
//    }
}

//: ---

/*: 378 p
 
 다수의 프로토콜을 따르는 타입의 경우, 각 프로토콜에서 같은 요구 사항이 있으면 어떻게 되는지 확인
 * 다수 중 하나만 구현해 주면 됨
    * 한 프로토콜이 get이고, 다른 프로토콜이 get과 set의 프로퍼티를 요구할 경우, get에 맞춰 작성
    * 같은 이름의 메서드의 경우, overload를 통해 선언해 주면 되므로 문제가 되지 않음
 * Do you want to add protocol stubs?를 이용해 자동으로 구문을 추가하면, 모든 프로토콜의 요구사항이 그대로 작성됨 --> Error(Invalid redeclaration) 발생
 
 */

protocol Protocol2 {
    var property1: Int { get }
    var property2: Int { get set }
    var property3: Int { get set }
    
    func function1(a: Int) -> String
    func function2(a: Int) -> String
}

protocol Protocol3 {
    var property1: Int { get }
    var property2: Int { get set }
    var property3: Int { get }
    
    func function1(a: Int) -> String
    func function2(a: Int) -> Int
    func function3(a: Int)
}

// 두 개의 프로토콜(Protocol2, Protocol3)을 따르는 구조체(Struct2) 선언
struct Struct2: Protocol2, Protocol3 {
    // MARK:- Properties
    var property1: Int              // 변수 저장 프로퍼티 가능
    
//    let property1: Int              // let을 통한 상수 저장 프로퍼티 가능
    
//    var property1: Int {            // 읽기/쓰기가 가능한 연산 프로퍼티 가능
//        get {
//            return 0
//        }
//        set {
//            self.property1 + newValue
//        }
//    }
    
//    var property1: Int {            // 읽기 전용 연산 프로퍼티 가능
//        get {
//            return 3
//        }
//    }
    
    var property2: Int              // 변수 저장 프로퍼티 가능
    
//    let property2: Int              // let을 통한 상수 저장 프로퍼티 불가
    
//    var property2: Int {            // 읽기/쓰기가 가능한 연산 프로퍼티 가능
//        get {
//            return 0
//        }
//        set {
//            self.property2 + newValue
//        }
//    }
    
//    var property2: Int {            // 읽기 전용 연산 프로퍼티 불가
//        get {
//            return 3
//        }
//    }
    
    var property3: Int              // 변수 저장 프로퍼티 가능
    
//    let property3: Int              // let을 통한 상수 저장 프로퍼티 불가
    
//    var property3: Int {            // 읽기/쓰기가 가능한 연산 프로퍼티 가능
//        get {
//            return 0
//        }
//        set {
//            self.property3 + newValue
//        }
//    }
    
//    var property3: Int {            // 읽기 전용 연산 프로퍼티 불가
//        get {
//            return 3
//        }
//    }
    
    // MARK:- Methods
    func function1(a: Int) -> String {
        ""
    }
    
    func function2(a: Int) -> String {
        ""
    }
    
    func function2(a: Int) -> Int {
        0
    }
    
    func function3(a: Int) {
        
    }
}

print("d")

//: [Next](@next)
