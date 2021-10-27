//
//  xxFilter.swift
//  CHAPTER 03
//
//  Created by 윤태민 on 10/27/21.
//

import Foundation
import CoreImage
import AppKit

typealias xxFilter = (CIImage) -> CIImage

func blur(radius: Double) -> xxFilter {
    return { image in
        let parameters: [String: Any] = [
            kCIInputRadiusKey: radius,
            kCIInputImageKey: image
        ]
        let filter = CIFilter(name: "CIGaussianBlur", parameters: parameters)!
        return filter.outputImage!
    }
}

func colorGenerator(color: NSColor) -> xxFilter {
    return { _ in
        return CIImage(color: CIColor(color: color)!)
    }
}

func compositeSourceOver(overlay: CIImage) -> xxFilter {
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

func colorOverlay(color: NSColor) -> xxFilter {
    return { image in
        let overlay = colorGenerator(color: color)(image)
        return compositeSourceOver(overlay: overlay)(image)
    }
}
