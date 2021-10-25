//
//  Position.swift
//  CHAPTER 02
//
//  Created by 윤태민 on 10/25/21.
//

import Foundation

struct Position {
    var x: Double
    var y: Double
}

extension Position {
    var length: Double {
        return sqrt(x * x + y * y)
    }
    
    func inRange(range: Distance) -> Bool {
        return length <= range
    }
    
    static func - (lhs: Position, rhs: Position) -> Position {
        return Position(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }
}
