//
//  xxRegion.swift
//  CHAPTER 02
//
//  Created by 윤태민 on 10/26/21.
//

import Foundation

typealias xxRegion = (Position) -> Bool

func circle(radius: Distance) -> xxRegion {
    return { point in
        return point.length <= radius
    }
}

func circle2(radius: Distance, center: Position) -> xxRegion {
    return { point in
        return (point - center).length <= radius
    }
}

func rectangle(width: Distance, height: Distance) -> xxRegion {
    return { point in
        return point.x >= (-width / 2) && point.x <= (width / 2)
            && point.y >= (-height / 2) && point.y <= (height / 2)
    }
}

func rectangle2(width: Distance, height: Distance, center: Position) -> xxRegion {
    return { point in
        let tmpPoint = point - center
        return tmpPoint.x >= (-width / 2) && tmpPoint.x <= (width / 2)
            && tmpPoint.y >= (-height / 2) && tmpPoint.y <= (height / 2)
    }
}

// 매개변수 region은 반환값에 사용되므로 탈출 클로저(@escaping)로 선언되어야 함
func shift(region: @escaping xxRegion, offset: Position) -> xxRegion {
    return { point in
        return region(point - offset)
    }
}

func invert(_ region: @escaping xxRegion) -> xxRegion {
    return { point in !region(point) }
}

func intersection(_ region1: @escaping xxRegion, _ region2: @escaping xxRegion) -> xxRegion {
    return { point in region1(point) && region2(point) }
}

func union(_ region1: @escaping xxRegion, _ region2: @escaping xxRegion) -> xxRegion {
    return { point in region1(point) || region2(point) }
}

func difference(_ region1: @escaping xxRegion, _ region2: @escaping xxRegion) -> xxRegion {
    return intersection(region1, invert(region2))
}
