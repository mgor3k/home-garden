//
//  Created by Maciej Gorecki on 13/06/2021
//

import SwiftUI

class MyGardenStore: ObservableObject {
    @Published var plants: [Plant] = [
        .init(name: "some plant", imageName: "1"),
        .init(name: "some other plant", imageName: "2"),
        .init(name: "some other plant", imageName: "3"),
        .init(name: "some other plant", imageName: "4"),
        .init(name: "some other plant", imageName: "5"),
    ]
    
    func isPlantLast(_ plant: Plant) -> Bool {
        plant == plants[plants.count - 1]
    }
    
    func isPlantFirst(_ plant: Plant) -> Bool {
        plant == plants.first
    }
}

struct Plant: Identifiable, Equatable, Hashable {
    let id = UUID()
    let name: String
    let imageName: String
}
