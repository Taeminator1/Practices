//
//  main.swift
//  CHAPTER 02
//
//  Created by 윤태민 on 10/25/21.
//

import Foundation

typealias Distance = Double

let myShip = Ship(position: Position(x: 3.0, y: 1.0), firingRange: 20.0, unsafeRange: 3.0)
let targetShip = Ship(position: Position(x: -5.0, y: 3.0), firingRange: 20.0, unsafeRange: 3.0)
//let friendlyShip = Ship(position: Position(x: -4.0, y: 3.0), firingRange: 20.0, unsafeRange: 3.0)
//let friendlyShip = Ship(position: Position(x: -2.0, y: 3.0), firingRange: 20.0, unsafeRange: 3.0)
let friendlyShip = Ship(position: Position(x: -1.0, y: 3.0), firingRange: 20.0, unsafeRange: 3.0)

print(myShip.canSafelyEnageShip2(target: targetShip, friendly: friendlyShip))
print(myShip.canSafelyEnageShip3(target: targetShip, friendly: friendlyShip))





func pointInRange(point: Position) -> Bool {
    return true
}

typealias Region = (Position) -> Bool

func circle(radius: Distance) -> Region {
    return { point in
        return point.length <= radius
    }
}

func circle2(radius: Distance, center: Position) -> Region {
    return { point in
        return (point - center).length <= radius
    }
}

func rectangle(width: Distance, height: Distance) -> Region {
    return { point in
        return point.x >= (-width / 2) && point.x <= (width / 2)
            && point.y >= (-height / 2) && point.y <= (height / 2)
    }
}

func rectangle2(width: Distance, height: Distance, center: Position) -> Region {
    return { point in
        let tmpPoint = point - center
        return tmpPoint.x >= (-width / 2) && tmpPoint.x <= (width / 2)
            && tmpPoint.y >= (-height / 2) && tmpPoint.y <= (height / 2)
    }
}

// 매개변수 region은 반환값에 사용되므로 탈출 클로저(@escaping)로 선언되어야 함
func shift(region: @escaping Region, offset: Position) -> Region {
    return { point in
        return region(point - offset)
    }
}

// MARK:- 임의의 점이 도형에 속하는지 확인하는 방법
// 1. cetner를 매개변수로 갖는 각각의 도형에 대한 함수를 선언
// 2. region: Region과 offst: Position을 매개변수로 갖고, Region을 반환하는 함수 선언(함수형 프로그래밍 적용)

// 반지름이 10이고 중심이 (5, 5)인 원에 (x, y)가 포함되는지 확인
print(shift(region: circle(radius: 10), offset: Position(x: 5, y: 5))(Position(x: 14, y: 5)))
print(shift(region: circle(radius: 10), offset: Position(x: 5, y: 5))(Position(x: 15, y: 5)))
print(shift(region: circle(radius: 10), offset: Position(x: 5, y: 5))(Position(x: 16, y: 5)))

print(circle2(radius: 10, center: Position(x: 5, y: 5))(Position(x: 14, y: 5)))
print(circle2(radius: 10, center: Position(x: 5, y: 5))(Position(x: 15, y: 5)))
print(circle2(radius: 10, center: Position(x: 5, y: 5))(Position(x: 16, y: 5)))

// 너비가 3, 높이가 4이고, 중심이 (5, 5)인 사각형에 (x, y)가 포함되는지 확인
print(rectangle2(width: 3, height: 4, center: Position(x: 1, y: 1))(Position(x: 2.5, y: 2)))
print(rectangle2(width: 3, height: 4, center: Position(x: 1, y: 1))(Position(x: 3, y: 2)))

print(shift(region: rectangle(width: 3, height: 4), offset: Position(x: 1, y: 1))(Position(x: 2.5, y: 2)))
print(shift(region: rectangle(width: 3, height: 4), offset: Position(x: 1, y: 1))(Position(x: 3, y: 2)))




func invert(_ region: @escaping Region) -> Region {
    return { point in !region(point) }
}

func intersection(_ region1: @escaping Region, _ region2: @escaping Region) -> Region {
    return { point in region1(point) && region2(point) }
}

func union(_ region1: @escaping Region, _ region2: @escaping Region) -> Region {
    return { point in region1(point) || region2(point) }
}

func difference(_ region1: @escaping Region, _ region2: @escaping Region) -> Region {
    return intersection(region1, invert(region2))
}
