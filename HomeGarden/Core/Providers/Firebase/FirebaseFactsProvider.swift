//
//  Created by Maciej Gorecki on 27/06/2021
//

import Foundation

struct FirebaseFactsProvider {
    let networkClient: NetworkClient
}

extension FirebaseFactsProvider: FactsProviding {
    func fetchFacts() async throws -> [Fact] {
        try await networkClient.execute(FirebaseFactsEndpoint())
    }
}
