//
//  Created by Maciej Gorecki on 27/06/2021
//

import Foundation

struct FirebaseFactsProvider: FactsProviding {
    func fetchFacts() async throws -> [Fact] {
        let url = URL(string: "https://homegarden-519db-default-rtdb.firebaseio.com/facts.json")!
        let (data, _) = try await URLSession.shared.data(from: url, delegate: nil)
        let parsed = try JSONDecoder().decode([Fact].self, from: data)
        return parsed
    }
}
