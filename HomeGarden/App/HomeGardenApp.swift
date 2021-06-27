//
//  Created by Maciej Gorecki on 13/06/2021.
//

import SwiftUI

@main
struct HomeGardenApp: App {
    @StateObject var state: AppState
    
    init() {
        #if MOCK
        let providers = Providers(facts: MockFactsProvider())
        #else
        let providers = Providers(facts: FirebaseFactsProvider())
        #endif
        
        _state = StateObject(wrappedValue: AppState(providers: providers))
    }
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                switch state.current {
                case .launching:
                    Color.blue
                case .onboarding:
                    OnboardingView(
                        didLogin: state.login
                    )
                case .running(let facts):
                    MainView(
                        store: .init(facts: facts),
                        onLogoutTapped: state.logout
                    )
                }
                
                LoaderView(isVisible: $state.isLoading)
            }
        }
    }
}
