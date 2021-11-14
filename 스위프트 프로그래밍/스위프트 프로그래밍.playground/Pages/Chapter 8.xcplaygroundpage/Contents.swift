//: [Home](Untitled%20Page)
//: \
//: [Previous](@previous)

import Foundation

//: ### CHAPTER 8 옵셔널
/*: 173p
 
 원시 값(rawValue)을 통해 enum type에 대한 객체를 생성할 때, 해당 객체가 어떤 타입으로 선언 되는지 확인
 * 고윳값을 통해 인스턴스를 생성할 때는 Type Name으로 선언된다.
 * 원시 값을 통해 인스턴스를 생성할 때는 Optional<Type Name>으로 선언된다.
 
 */

// String 타입의 원시 값을 각각의 case마다 부여
enum School: String {
    case primary = "kinder"
    case elementary = "elementary"
    case middle = "middle"
    case high = "high"
    case colleage = "collage"
    case university = "university"
    case graduate = "graduate"
}


let primary1 = School.primary                   // 고윳값을 통해 인스턴스 생성
let primary2 = School(rawValue: "kinder")       // 원시 값을 통해 인스턴스 생성
let graduate = School(rawValue: "doctorate")    // 원시 값이 없는 인스턴스 생성

print(type(of: primary1))   // "School\n"
print(type(of: primary2))   // "Optional<School>\n": 원시 값으로 인스턴스가 생성되었기 때문에 Optional<Type Name> 출력
print(type(of: graduate))   // "Optional<School>\n": 원시 값으로 인스턴스가 생성되었기 때문에 Optional<Type Name> 출력

print(primary1)             // "primary\n"
print(primary2 ?? "")       // "primary\n"
print(graduate ?? "")       // "\n"

print(primary1.rawValue)            // "kinder\n"
print(primary2?.rawValue ?? "")     // "kinder\n"
print(graduate?.rawValue ?? "")     // "\n"

//: [Next](@next)
