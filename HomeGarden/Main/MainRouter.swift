//
//  Created by Maciej Gorecki on 15/06/2021
//

import SwiftUI

class MainRouter: ObservableObject {
    @Published var currentPage: Page = .home
    
    var actionPage: Page {
        .bookmarks
    }
    
    var pages: [Page] {
        [.home, .search, .bookmarks, .notifications]
    }
}
