//
//  Created by Maciej Gorecki on 19/06/2021
//

import Foundation

class AppState: ObservableObject {
    @Published var current: State = .launching
    @Published var isLoading = false
    
    let providers: Providers
    
    init(providers: Providers) {
        self.providers = providers
        // TODO: Check if user is authenticated
        current = .onboarding
    }
    
    func login() {
        isLoading = true
        async {
            let facts = try? await providers.facts.fetchFacts()
            await didLogin(facts: facts ?? [])
        }
    }
    
    @MainActor
    func didLogin(facts: [Fact]) {
        isLoading = false
        current = .running(facts)
    }
    
    func logout() {
        current = .onboarding
    }
}

extension AppState {
    enum State {
        case launching
        case onboarding
        case running([Fact])
    }
}
