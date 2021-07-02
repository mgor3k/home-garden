//
//  Created by Maciej Gorecki on 02/07/2021
//

import Foundation
import UIKit

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    private let url: URL
    private var cache: ImageCache?
    private var isLoading = false
    
    init(url: URL, cache: ImageCache? = nil) {
        self.url = url
        self.cache = cache
    }
    
    var cached: UIImage? {
        cache?[url]
    }
    
    func load() {
        guard !isLoading else { return }
        
        if let image = cache?[url] {
            self.image = image
            return
        }
        
        isLoading = true
        
        async {
            do {
                let (data, _) = try await URLSession.shared.data(from: url, delegate: nil)
                let image = UIImage(data: data)
                await setImage(image)
                isLoading = false
            } catch {
                print(error)
                
                isLoading = false
            }
        }
    }
    
    @MainActor
    private func setImage(_ image: UIImage?) {
        self.image = image
        cache?[url] = image
    }
}
