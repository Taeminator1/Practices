//: [Home](Untitled%20Page)
//: \
//: [Previous](@previous)

import Foundation

//: ### CHAPTER 25 패턴
/*: 450 p
 
 case 문에서 와일드 카드를 이용하면 default를 쓰지 않아도 되느지 확인:
 * switch의 대상이 되는 값을 구성하는 요소가 모두 와일드 카드이면 default를 쓰지 않아도 됨
 
 */

var person1 = (name: "Taeminator", age: 28)

switch person1 {         // 튜플을 구성하는 요소 모두가 와일드 카드로 사용해야 default를 쓰지 않아도 됨
case (_, _):
    print("\(person1.name) is \(person1.age) years old.")
}

switch person1 {         // 튜플을 구성하는 하나의 요소만 와일드 카드로 사용했기 때문에 default를 써야 함
case ("Taeminator", _):
    print("\(person1.name) is \(person1.age) years old.")
case (_, 28):
    print("\(person1.name) is \(person1.age) years old.")
default:
    print("\(person1.name) is \(person1.age) years old.")
}

//: ---

/*: 451 p
 
 식별자 패턴을 이용할 때, 변수에 바인딩 가능한지 확인
 * 값 바인딩 패턴의 일종인 식별자 패턴은 매칭되는 값을 새로운 이름의 변수 또는 상수에 바인딩
 * 튜플의 각 속성에 대해 각각 식별자 패턴을 적용할 수 있음
 
 */

var person2 = (name: "Yun", gender: "Male")

switch person2 {
case let (name, gender):
    print("\(name) is \(gender)")
}

switch person2 {
case (var name, let gender):                // gender 변수는 아래에서 수정되지 않기 때문에 let으로 선언
    name += " Taemin"
    print("\(name) is \(gender)")
}

//: [Next](@next)
