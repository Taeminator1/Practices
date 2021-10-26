//
//  main.swift
//  CHAPTER 02
//
//  Created by 윤태민 on 10/25/21.
//

import Foundation

typealias Distance = Double

// MARK:- 임의의 점이 도형에 속하는지 확인
print("**test1**")
// 반지름이 10이고 중심이 (5, 5)인 원에 (x, y)가 포함되는지 확인
print(shift(region: circle(radius: 10), offset: Position(x: 5, y: 5))(Position(x: 14, y: 5)))
print(shift(region: circle(radius: 10), offset: Position(x: 5, y: 5))(Position(x: 15, y: 5)))
print(shift(region: circle(radius: 10), offset: Position(x: 5, y: 5))(Position(x: 16, y: 5)))

print(circle2(radius: 10, center: Position(x: 5, y: 5))(Position(x: 14, y: 5)))
print(circle2(radius: 10, center: Position(x: 5, y: 5))(Position(x: 15, y: 5)))
print(circle2(radius: 10, center: Position(x: 5, y: 5))(Position(x: 16, y: 5)))

let c: Region = circle(radius: 10)
print(c.shift(offset: Position(x: 5, y: 5)).contains(Position(x: 14, y: 5)))
print(c.shift(offset: Position(x: 5, y: 5)).contains(Position(x: 15, y: 5)))
print(c.shift(offset: Position(x: 5, y: 5)).contains(Position(x: 16, y: 5)))


// 너비가 3, 높이가 4이고, 중심이 (1, 1)인 사각형에 (x, y)가 포함되는지 확인
print(rectangle2(width: 3, height: 4, center: Position(x: 1, y: 1))(Position(x: 2.5, y: 2)))
print(rectangle2(width: 3, height: 4, center: Position(x: 1, y: 1))(Position(x: 3, y: 2)))

print(shift(region: rectangle(width: 3, height: 4), offset: Position(x: 1, y: 1))(Position(x: 2.5, y: 2)))
print(shift(region: rectangle(width: 3, height: 4), offset: Position(x: 1, y: 1))(Position(x: 3, y: 2)))

let r: Region = rectangle(width: 3, height: 4)
print(r.shift(offset: Position(x: 1, y: 1)).contains(Position(x: 2.5, y: 2)))
print(r.shift(offset: Position(x: 1, y: 1)).contains(Position(x: 3, y: 2)))




// MARK:- 함선 간의 관계 확인
print("**test2**")
let myShip = Ship(position: Position(x: 3.0, y: 1.0), firingRange: 20.0, unsafeRange: 3.0)
let targetShip = Ship(position: Position(x: -5.0, y: 3.0), firingRange: 20.0, unsafeRange: 3.0)
let friendlyShip1 = Ship(position: Position(x: -4.0, y: 3.0), firingRange: 20.0, unsafeRange: 3.0)
let friendlyShip2 = Ship(position: Position(x: -2.0, y: 3.0), firingRange: 20.0, unsafeRange: 3.0)
let friendlyShip3 = Ship(position: Position(x: -1.0, y: 3.0), firingRange: 20.0, unsafeRange: 3.0)

print(myShip.canSafelyEnageShip2(target: targetShip, friendly: friendlyShip1))
print(myShip.canSafelyEnageShip2(target: targetShip, friendly: friendlyShip2))
print(myShip.canSafelyEnageShip2(target: targetShip, friendly: friendlyShip3))

print(myShip.canSafelyEnageShip3(target: targetShip, friendly: friendlyShip1))
print(myShip.canSafelyEnageShip3(target: targetShip, friendly: friendlyShip2))
print(myShip.canSafelyEnageShip3(target: targetShip, friendly: friendlyShip3))

print(myShip.canSafelyEnageShip4(target: targetShip, friendly: friendlyShip1))
print(myShip.canSafelyEnageShip4(target: targetShip, friendly: friendlyShip2))
print(myShip.canSafelyEnageShip4(target: targetShip, friendly: friendlyShip3))

