//
//  Created by Maciej Gorecki on 13/06/2021.
//

import SwiftUI

@main
struct HomeGardenApp: App {
    @StateObject var state = AppState(providers: .environmentBased)
    
    var body: some Scene {
        WindowGroup {
            content
                .environment(\.imageCache, InMemoryImageCache())
        }
    }
    
    var content: some View {
        ZStack {
            switch state.current {
            case .launching:
                Color.blue
            case .onboarding:
                OnboardingView(
                    didLogin: state.login
                )
            case .running(let store):
                MainView(
                    store: store,
                    onLogoutTapped: state.logout
                )
            }
            
            LoaderView(isVisible: $state.isLoading)
        }
    }
}
