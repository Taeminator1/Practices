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
