//
//  Filter.swift
//  CHAPTER 03
//
//  Created by 윤태민 on 10/27/21.
//

import Foundation
import CoreImage
import AppKit

struct Filter {
    var lookup: (CIImage) -> CIImage = { image in image }
    
    func blur(radius: Double) -> Filter {
        return Filter { image in
            let parameters: [String: Any] = [
                kCIInputRadiusKey: radius,
                kCIInputImageKey: image
            ]
            
            let filter = CIFilter(name: "CIGaussianBlur", parameters: parameters)!
            return filter.outputImage!
        }
    }
    
    func colorGenerator(color: NSColor) -> Filter {
        return Filter { _ in
            return CIImage(color: CIColor(color: color)!)
        }
    }
    
    func compositeSourceOver(overlay: CIImage) -> Filter {
        return Filter { image in
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
        return Filter { image in
            let overlay = colorGenerator(color: color).lookup(image)
            return compositeSourceOver(overlay: overlay).lookup(image)
        }
    }
}
