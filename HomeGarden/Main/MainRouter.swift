//
//  Created by Maciej Gorecki on 15/06/2021
//

import SwiftUI

class MainRouter: ObservableObject {
    @Published var currentPage: Page = .home
    @Published var selectedPlant: Plant?
    @Published var isPresenting = false
        
    var tabBarModel: CustomTabBar.ViewModel {
        .init(
            actionPage: .bookmarks,
            page1: .home,
            page2: .search,
            page3: .bookmarks,
            page4: .notifications
        )
    }
    
    func dismissDetails() {
        withAnimation {
            isPresenting = false
        }
    }
}
