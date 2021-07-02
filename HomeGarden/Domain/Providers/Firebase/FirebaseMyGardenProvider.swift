//
//  Created by Maciej Gorecki on 27/06/2021
//

import Foundation

struct FirebaseMyGardenProvider {
    let networkClient: NetworkClient
}

extension FirebaseMyGardenProvider: MyGardenProviding {
    func fetchMyGarden() async throws -> [Plant] {
        try await networkClient.execute(FirebaseMyGardenEndpoint())
    }
}
