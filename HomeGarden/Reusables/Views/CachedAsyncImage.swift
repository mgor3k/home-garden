//
//  Created by Maciej Gorecki on 02/07/2021
//

import SwiftUI

struct CachedAsyncImage<Placeholder: View>: View {
    @StateObject private var loader: ImageLoader
    private let placeholder: Placeholder
    private let image: (Image) -> Image
    
    init(
        url: URL,
        @ViewBuilder image: @escaping (Image) -> Image = { $0 },
        @ViewBuilder placeholder: () -> Placeholder
    ) {
        self.image = image
        self.placeholder = placeholder()
        _loader = StateObject(
            wrappedValue: ImageLoader(
                url: url,
                cache: Environment(\.imageCache).wrappedValue
            )
        )
    }
    
    var body: some View {
        if let cached = loader.cached {
            self.image(Image(uiImage: cached))
        } else {
            content
                .onAppear(perform: loader.load)
        }
    }
    
    var content: some View {
        Group {
            if let image = loader.image {
                self.image(Image(uiImage: image))
            } else {
                placeholder
            }
        }
    }
}

struct CachedAsyncImage_Previews: PreviewProvider {
    static var previews: some View {
        CachedAsyncImage(
            url: .init(string: "https://i.imgur.com/88wKG2m.png")!
        ) {
            Color.blue
        }
    }
}
