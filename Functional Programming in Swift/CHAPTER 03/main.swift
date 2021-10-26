//
//  main.swift
//  CHAPTER 03
//
//  Created by 윤태민 on 10/26/21.
//

import Foundation
import CoreImage
import AppKit

typealias Filter = (CIImage) -> CIImage

func blur(radius: Double) -> Filter {
    return { image in
        let parameters: [String: Any] = [
            kCIInputRadiusKey: radius,
            kCIInputImageKey: image
        ]
        let filter = CIFilter(name: "CIGaussianBlur", parameters: parameters)!
        return filter.outputImage!
    }
}

func colorGenerator(color: NSColor) -> Filter {
    return { _ in
        return CIImage(color: CIColor(color: color)!)
    }
}

func compositeSourceOver(overlay: CIImage) -> Filter {
    return { image in
        let parameters = [
            kCIInputRadiusKey: image,
            kCIInputImageKey: overlay
        ]
        let filter = CIFilter(name: "CIGaussianBlur", parameters: parameters)!
        let cropRect = image.extent
        return filter.outputImage!.cropped(to: cropRect)
    }
}

func colorOverlay(color: NSColor) -> Filter {
    return { image in
        let overlay = colorGenerator(color: color)(image)
        return compositeSourceOver(overlay: overlay)(image)
    }
}

let url = URL(string: "http://www.objc.io/images/covers/16.jpg")!
let image = CIImage(contentsOf: url)!


let blurRadius = 5.0
let overlayColor = NSColor.red.withAlphaComponent(0.2)

// 단계별로 property에 할당해서 최종 이미지 저장
// 코드의 수가 길어짐
let blurredImage1 = blur(radius: blurRadius)(image)
let resultImage1 = colorOverlay(color: overlayColor)(blurredImage1)

// 한줄로 최종 이미지 저장
// 괄호의 수가 많아져 직관적이지 않음
let resultImage2 = colorOverlay(color: overlayColor)(blur(radius: blurRadius)(image))

// 필터를 합성하는 함수를 정의
// 함수를 새로 정의해야 하는 번거로움이 있지만, 재사용이 가능하고 직관적으로 이해할 수 있음
func composeFilters(_ filter1: @escaping Filter, _ filter2: @escaping Filter) -> Filter {
    return { image in filter2(filter1(image)) }
}

let myFilter3 = composeFilters(blur(radius: blurRadius), colorOverlay(color: overlayColor))
let resultImage3 = myFilter3(image)

// 필터를 합성하는 연산자 정의
// 연산자를 새로 정의해야 하는 번거로움이 있지만, 재사용이 가능하고 직관적으로 이해할 수 있음
// 한 번 만들면 쉽게 사용 가능
precedencegroup myPrecedencegroup {
    associativity: left
}

infix operator >>>: myPrecedencegroup
func >>> (_ filter1: @escaping Filter, _ filter2: @escaping Filter) -> Filter {
    return { image in filter2(filter1(image)) }
}

let myFilter4 = blur(radius: blurRadius) >>> colorOverlay(color: overlayColor)
let resultImage4 = myFilter4(image)
