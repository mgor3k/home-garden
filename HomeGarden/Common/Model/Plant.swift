//
//  Created by Maciej Gorecki on 18/06/2021
//

import Foundation

struct Plant: Identifiable, Equatable, Hashable {
    let id = UUID()
    let name: String
    let imageName: String
    let features: [PlantFeature]
    
    let description: String
}

struct PlantFeature: Identifiable, Hashable, Equatable {
    let id = UUID()
    let title: String
    let value: String
    let systemImageName: String
}
