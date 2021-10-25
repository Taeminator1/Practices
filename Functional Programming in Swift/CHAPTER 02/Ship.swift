//
//  Ship.swift
//  CHAPTER 02
//
//  Created by 윤태민 on 10/25/21.
//

import Foundation

struct Ship {
    var position: Position
    var firingRange: Distance
    var unsafeRange: Distance
}

extension Ship {
    // target이 공격 범위 내에 있는지 확인
    func canEnageShip(target: Ship) -> Bool {
        let dx = target.position.x - position.x
        let dy = target.position.y - position.y
        let targetDistance = sqrt(dx * dx + dy * dy)
        return targetDistance <= firingRange
    }
    
    // target이 공격 범위 내에 있으며, 현재 위치로부터 근접한 상황이 아닌지 확인
    func canSafelyEngageShip(target: Ship) -> Bool {
        let dx = target.position.x - position.x
        let dy = target.position.y - position.y
        let targetDistance = sqrt(dx * dx + dy * dy)
        return targetDistance <= firingRange && targetDistance > unsafeRange
    }

    // target이 공격 범위 내에 있으며, 현재 위치로부터 근접한 상황이 아니고, 적군이 아군과 근접한 상황이 아닌지 확인
    func canSafelyEnageShip1(target: Ship, friendly: Ship) -> Bool {
        let dx = target.position.x - position.x
        let dy = target.position.y - position.y
        // 현재 위치로부터 적군 함선까지의 거리
        let targetDistance = sqrt(dx * dx + dy * dy)
        
        let friendlyDx = friendly.position.x - target.position.x
        let friendlyDy = friendly.position.y - target.position.y
        // 아군 함선의 위치로부터 적군 함선까지의 거리
        let friendlyDistance = sqrt(friendlyDx * friendlyDx * friendlyDy * friendlyDy)
        
        return targetDistance <= firingRange && targetDistance > unsafeRange && friendlyDistance > unsafeRange
    }
    
    // target이 공격 범위 내에 있으며, 현재 위치로부터 근접한 상황이 아니고, 적군이 아군과 근접한 상황이 아닌지 확인
    // 사용자 정의 연사자 적용 결과 canSafelyEngageShip1 보다 가독성이 좋아짐
    func canSafelyEnageShip2(target: Ship, friendly: Ship) -> Bool {
        // 현재 위치로부터 적군 함선까지의 거리
        let targetDistance = (target.position - position).length
        
        // 아군 함선의 위치로부터 적군 함선까지의 거리
        let friendlyDistance = (friendly.position - target.position).length
        
        return targetDistance <= firingRange && targetDistance > unsafeRange && friendlyDistance > unsafeRange
    }
    
    // target이 공격 범위 내에 있으며, 현재 위치로부터 근접한 상황이 아니고, 적군이 아군과 근접한 상황이 아닌지 확인
    // 함수형 프로그래밍 적용하여, canSafelyEnageShip1, 2 보다 더 선언적임
    func canSafelyEnageShip3(target: Ship, friendly: Ship) -> Bool {
        let rangeRegion = difference(circle(radius: firingRange), circle(radius: unsafeRange))
        let firingRegion = shift(region: rangeRegion, offset: position)
        let friendlyRegion = shift(region: circle(radius: unsafeRange), offset: friendly.position)
        let resultRegion = difference(firingRegion, friendlyRegion)
        return resultRegion(target.position)
    }
}
