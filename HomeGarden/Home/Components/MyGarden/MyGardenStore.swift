//
//  Created by Maciej Gorecki on 13/06/2021
//

import SwiftUI

class MyGardenStore: ObservableObject {
    @Published var plants: [Plant] = [
        .init(name: "some plant", imageName: "1", features: [
            .init(title: "Watering", value: "Once a week", systemImageName: "drop"),
            .init(title: "Fertilizing", value: "Every 6 months", systemImageName: "eyedropper"),
            .init(title: "Indoors", value: "Medium light", systemImageName: "lightbulb")
        ]),
        .init(name: "some other plant", imageName: "2", features: []),
        .init(name: "some other plant", imageName: "3", features: []),
        .init(name: "some other plant", imageName: "4", features: []),
        .init(name: "some other plant", imageName: "5", features: []),
    ]
    
    func isPlantLast(_ plant: Plant) -> Bool {
        plant == plants[plants.count - 1]
    }
    
    func isPlantFirst(_ plant: Plant) -> Bool {
        plant == plants.first
    }
}
