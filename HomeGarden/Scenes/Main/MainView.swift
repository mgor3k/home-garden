//
//  Created by Maciej Gorecki on 15/06/2021
//

import SwiftUI

struct MainView: View {
    @Namespace var namespace
    @StateObject var router = MainRouter()
    @StateObject var store: MainStore
    
    let onLogoutTapped: () -> Void
    
    var body: some View {
        ZStack {
            content
            
            if let plant = router.selectedPlant {
                PlantDetails(
                    namespace: namespace,
                    plant: plant,
                    onDismiss: router.dismissDetails
                )
                    .background(Color.white.ignoresSafeArea())
                    .zIndex(3)
            }
        }
        .hidesTabBar()
    }
    
    var content: some View {
        GeometryReader { proxy in
            VStack(spacing: 0) {
                TabView(selection: $router.currentPage) {
                    HomeView(
                        namespace: namespace,
                        store: .init(facts: store.facts),
                        selectedPlant: $router.selectedPlant,
                        onSearchTapped: router.switchToSearch,
                        onLogoutTapped: onLogoutTapped
                    )
                        .tag(Page.home)
                    
                    SearchView()
                        .tag(Page.search)
                
                    BookmarksView()
                        .tag(Page.bookmarks)
                
                    NotificationsView()
                        .tag(Page.notifications)
                
                    CameraView()
                        .tag(Page.camera)
                }
                
                // TODO: Check non-notch devices
                CustomTabBar(
                    viewModel: router.tabBarModel,
                    currentPage: $router.currentPage
                )
                    .frame(
                        width: proxy.size.width,
                        height: proxy.size.height / 12
                    )
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(store: MainStore(facts: []), onLogoutTapped: {})
    }
}
