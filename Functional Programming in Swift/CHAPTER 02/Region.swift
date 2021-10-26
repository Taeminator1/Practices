//
//  Region.swift
//  CHAPTER 02
//
//  Created by 윤태민 on 10/25/21.
//

import Foundation

struct Region {
    let contains: (Position) -> Bool
    
    func shift(offset: Position) -> Region {
        return Region { point in
            self.contains(point - offset)
        }
    }
    
    func invert() -> Region {
        return Region { point in
            !self.contains(point)
        }
    }
    
    func intersection(region: Region) -> Region {
        return Region { point in
            self.contains(point) && region.contains(point)
        }
    }
    
    func union(region: Region) -> Region {
        return Region { point in
            self.contains(point) || region.contains(point)
        }
    }
    
    func difference(region: Region) -> Region {
        self.intersection(region: region.invert())
    }
}

func circle(radius: Distance) -> Region {
    return Region { point in
        point.length <= radius
    }
}

func rectangle(width: Distance, height: Distance) -> Region {
    return Region { point in
        point.x >= (-width / 2) && point.x <= (width / 2)
            && point.y >= (-height / 2) && point.y <= (height / 2)
    }
}
