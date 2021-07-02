//
//  Created by Maciej Gorecki on 02/07/2021
//

import Foundation

struct DefaultsStorage: Storage {
    var defaults: UserDefaults = .standard
    
    func store<T: Encodable>(_ data: T, key: String) {
        if let encoded = try? JSONEncoder().encode(data) {
            defaults.set(encoded, forKey: key)
        }
    }
    
    func read<T: Decodable>(key: String) -> T? {
        guard let data = defaults.data(forKey: key) else { return nil }
        return try? JSONDecoder().decode(T.self, from: data)
    }
}
