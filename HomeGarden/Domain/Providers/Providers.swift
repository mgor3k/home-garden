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

struct Providers {
    let facts: FactsProviding
    let myGarden: MyGardenProviding
}

extension Providers {
    static let mock = Self(
        facts: MockFactsProvider(),
        myGarden: MockMyGardenProvider()
    )
    
    static let firebase = Self(
        facts: FirebaseFactsProvider(),
        myGarden: FirebaseMyGardenProvider()
    )
    
    static var environmentBased: Self {
        #if MOCK
        return Providers.mock
        #else
        return Providers.firebase
        #endif
    }
}
