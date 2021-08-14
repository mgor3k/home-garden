//
//  Created by Maciej Gorecki on 02/07/2021
//

import Foundation
import UIKit

protocol ImageCache {
    subscript(_ url: URL) -> UIImage? { get set }
}

class InMemoryImageCache: ImageCache {
    private let cache = NSCache<NSURL, UIImage>()
    
    subscript(_ url: URL) -> UIImage? {
        get {
            cache.object(forKey: url as NSURL)
        }
        set {
            if let image = newValue {
                cache.setObject(image, forKey: url as NSURL)
            } else {
                cache.removeObject(forKey: url as NSURL)
            }
        }
    }
}
