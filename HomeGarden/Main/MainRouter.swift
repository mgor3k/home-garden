//
//  Created by Maciej Gorecki on 15/06/2021
//

import SwiftUI

class MainRouter: ObservableObject {
    @Published var currentPage: Page = .home
    
    var possiblePages: [Page] {
        [.home, .search]
    }
}
