//
//  Created by Maciej Gorecki on 19/06/2021
//

import Foundation

struct Providers {
    let facts: FactsProviding
    let myGarden: MyGardenProviding
}

protocol FactsProviding {
    func fetchFacts() async throws -> [Fact]
}

protocol MyGardenProviding {
    func fetchMyGarden() async throws -> [Plant]
}
