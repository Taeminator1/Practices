//: [Home](Untitled%20Page)
//: \
//: [Previous](@previous)

import Foundation

//: ### CHAPTER 28 오류처리
/*: 497 p
 
 throws가 함수나 메서드의 자체 타입에 미치는 영향 확인
 * throws 키워드가 없는 함수 또는 메서드는 throws 키워드가 있는 함수 또는 메서드와 구분 됨
 
 throws 여부에 따른 override 가능 여부 확인
 * throws를 포함한 함수, 메서드, 이니셜라이저는 일반 함수, 메서드, 이니셜라이저로 재정의할 수 있다. (thorws를 포함할 수도 있고 안 할 수도 있음)
 * 일반 함수, 메서드, 이니셜라이저는 throws를 포함한 함수, 메서드, 이니셜라이저로 재정의할 수 없다. (throws를 포함하면 안 됨)
 
 */

// MARK:- 오류의 종류 포현
enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}

// MARK:- 함수에서 발생한 오류 알리기 예제
struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Biscuit": Item(price: 7, count: 11),
    ]
    
    var coinsDeposited = 0
    
    func dispense(snack: String) {
        print("\(snack) 제공")
    }
    
    func vend(itemNamed name: String) throws {
        
        // 오류 처리 부분 ↓
        guard let item = self.inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        
        guard item.price <= self.coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - self.coinsDeposited)
        }
        // 오류 처리 부분 ↑
        
        self.coinsDeposited -= item.price
        
        var newItem = item
        newItem.count -= 1
        self.inventory[name] = newItem
        
        self.dispense(snack: name)
    }
    
    func throwingMethod() throws { }
    
    func nonThrowingMethod() { }
}

class ChildVendingMachine1: VendingMachine {

    override func throwingMethod() { }

    override func nonThrowingMethod() { }
}

class ChildVendingMachine2: VendingMachine {

    override func throwingMethod() throws { }
    
    // 일반 메서드를 throws를 포함하는 메서드로 재정의 불가능
//    override func nonThrowingMethod() throws { }
}

let favoriteSnacks = [
    "person1": "Chips",
    "person2": "Biscuit",
    "person3": "Chocolate",
]

func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? ""
    try vendingMachine.vend(itemNamed: snackName)
}

print(type(of: buyFavoriteSnack))               // "(String, VendingMachine) throws -> ()\n"

let machine: VendingMachine = VendingMachine()
machine.coinsDeposited = 30

// favoriteSnacks에 대한 값이 "Candy Bar", "Chips", "Biscuit" 중에 없으면 에러 발생
//for (person, favoriteSnack) in favoriteSnacks {
//    print(person, favoriteSnack)
//    try buyFavoriteSnack(person: person, vendingMachine: machine)
//}

//: ---

/*: 503 p
 
 제네릭을 포함한 인스턴스를 생성할 때, 제네릭으로 선언된 타입을 추정하는 지 확인
 * Array에 대한 인스턴스를 생성할 때,
    * 원소와 함께 인스턴스를 생성하면, 해당 인스턴스의 타입으로 Element의 타입이 자동 설정 됨
    * 원소가 없으면, Element의 타입을 추정할 수 없기 때문에, Element의 타입을 명시해 줘야 함
 
 */

func someThrowingFunction(shouldThrowError: Bool) throws -> Int {
    if shouldThrowError {
        enum SomeError: Error {
            case justSomeError
        }
        
        throw SomeError.justSomeError
    }
    
    return 100
}

// Optional<Int> 또는 Optional로 선언 가능하지만, 모두 Optioanl<Int>로 자동 선언 됨
let x: Optional<Int> = try? someThrowingFunction(shouldThrowError: true)
let y: Optional = try? someThrowingFunction(shouldThrowError: true)

print(type(of: x))                          // "Optional<Int>\n"
print(type(of: y))                          // "Optional<Int>\n"

var a: Array = [1, 2, 3]
print(a)                                    // "[1, 2, 3]\n"
print(type(of: a))                          // "Array<Int>\n"

// 포함하는 원소가 없어 아래와 같이 선언 불가능
//var b: Array = []

var c: Array = [1, "1"] as [Any]
print(c)                                    // "[1, "1"]\n"
print(type(of: c))                          // "Array<Any>\n"

var d: Array<Any> = [1, "1"]
print(c)                                    // "[1, "1"]\n"
print(type(of: c))                          // "Array<Any>\n"

//: [Next](@next)
