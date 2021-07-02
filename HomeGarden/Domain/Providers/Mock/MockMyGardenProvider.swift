//
//  Created by Maciej Gorecki on 27/06/2021
//

import Foundation

struct MockMyGardenProvider: MyGardenProviding {
    static let plants: [Plant] = [
        .init(id: "1", name: "some plant", imageURL: URL(string: "https://i.imgur.com/88wKG2m.png")!, features: [
            .init(id: "1", title: "Watering", value: "Once a week", systemImageName: "drop"),
            .init(id: "2", title: "Fertilizing", value: "Every 6 months", systemImageName: "eyedropper"),
            .init(id: "3", title: "Indoors", value: "Medium light", systemImageName: "lightbulb")
        ], description: "It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
        .init(id: "2", name: "some other plant", imageURL: URL(string: "https://i.imgur.com/88wKG2m.png")!, features: [], description: ""),
        .init(id: "3", name: "some other plant", imageURL: URL(string: "https://i.imgur.com/88wKG2m.png")!, features: [], description: ""),
        .init(id: "4", name: "some other plant", imageURL: URL(string: "https://i.imgur.com/88wKG2m.png")!, features: [], description: ""),
        .init(id: "5", name: "some other plant", imageURL: URL(string: "https://i.imgur.com/88wKG2m.png")!, features: [], description: "")
    ]
    
    func fetchMyGarden() async throws -> [Plant] {
        await withUnsafeContinuation { continuation in
            DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
                continuation.resume(returning: Self.plants)
            }
        }
    }
}
