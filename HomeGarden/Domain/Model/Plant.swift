//
//  Created by Maciej Gorecki on 18/06/2021
//

import Foundation

struct Plant: Identifiable, Equatable, Hashable, Decodable {
    let id: String
    let name: String
    let imageURL: String
    let features: [PlantFeature]?
    
    let description: String
}

struct PlantFeature: Identifiable, Hashable, Equatable, Decodable {
    let id: String
    let title: String
    let value: String
    let systemImageName: String
}
