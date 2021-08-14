//
//  Created by Maciej Gorecki on 02/07/2021
//

import Foundation

protocol Storage {
    func store<T: Encodable>(_ data: T, key: String)
    func read<T: Decodable>(key: String) -> T?
}
