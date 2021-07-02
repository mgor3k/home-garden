//
//  Created by Maciej Gorecki on 02/07/2021
//

import Foundation

enum NetworkError: Error {
    case invalid(response: HTTPURLResponse)
    case invalidURL(url: String)
    case unknown
}
