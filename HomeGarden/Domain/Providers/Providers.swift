//
//  Created by Maciej Gorecki on 19/06/2021
//

import Foundation

protocol FactsProviding {
    func fetchFacts() async throws -> [Fact]
}

protocol MyGardenProviding {
    func fetchMyGarden() async throws -> [Plant]
}
