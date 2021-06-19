//
//  Created by Maciej Gorecki on 15/06/2021
//

import SwiftUI

enum Page: Hashable {
    case home
    case search
    case bookmarks
    case notifications
    
    case camera
}

extension Page {
    var imageName: String {
        switch self {
        case .home:
            return "house.fill"
        case .search:
            return "magnifyingglass"
        case .bookmarks:
            return "bookmark"
        case .notifications:
            return "bell"
        case .camera:
            return "square.dashed"
        }
    }
}
