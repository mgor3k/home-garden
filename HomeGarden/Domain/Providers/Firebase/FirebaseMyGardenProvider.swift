//
//  Created by Maciej Gorecki on 27/06/2021
//

import Foundation

struct FirebaseMyGardenProvider: MyGardenProviding {
    func fetchMyGarden() async throws -> [Plant] {
        let url = URL(string: "https://homegarden-519db-default-rtdb.firebaseio.com/plants.json")!
        let (data, _) = try await URLSession.shared.data(from: url, delegate: nil)
        let parsed = try JSONDecoder().decode([Plant].self, from: data)
        return parsed
    }
}
