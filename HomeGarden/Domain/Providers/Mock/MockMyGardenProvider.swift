//
//  Created by Maciej Gorecki on 27/06/2021
//

import Foundation

struct MockMyGardenProvider: MyGardenProviding {
    static let plants: [Plant] = [
        .init(name: "some plant", imageName: "1", features: [
            .init(title: "Watering", value: "Once a week", systemImageName: "drop"),
            .init(title: "Fertilizing", value: "Every 6 months", systemImageName: "eyedropper"),
            .init(title: "Indoors", value: "Medium light", systemImageName: "lightbulb")
        ], description: "It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
        .init(name: "some other plant", imageName: "2", features: [], description: ""),
        .init(name: "some other plant", imageName: "3", features: [], description: ""),
        .init(name: "some other plant", imageName: "4", features: [], description: ""),
        .init(name: "some other plant", imageName: "5", features: [], description: "")
    ]
    
    func fetchMyGarden() async throws -> [Plant] {
        await withUnsafeContinuation { continuation in
            DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
                continuation.resume(returning: Self.plants)
            }
        }
    }
}
