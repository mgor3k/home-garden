//
//  Created by Maciej Gorecki on 19/06/2021
//

import Foundation

struct Providers {
    let facts: FactsProviding
}

protocol FactsProviding {
    func fetchFacts() async throws -> [Fact]
}
