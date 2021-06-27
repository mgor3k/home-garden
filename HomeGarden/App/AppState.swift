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
            do {
                let facts = try await providers.facts.fetchFacts()
                let myGarden = try await providers.myGarden.fetchMyGarden()
                await didLogin(store: .init(facts: facts, myGarden: myGarden))
            } catch {
                print(error)
            }
        }
    }
    
    @MainActor
    func didLogin(store: MainStore) {
        isLoading = false
        current = .running(store)
    }
    
    func logout() {
        current = .onboarding
    }
}

extension AppState {
    enum State {
        case launching
        case onboarding
        case running(MainStore)
    }
}
