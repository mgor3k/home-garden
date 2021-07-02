//
//  Created by Maciej Gorecki on 19/06/2021
//

import Foundation

class AppState: ObservableObject {
    @Published var current: State = .launching
    @Published var isLoading = false
    
    let dependencies: Dependencies
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        // TODO: Check if user is authenticated
        current = .onboarding
    }
    
    func login(credentials: LoginCredentials) {
        isLoading = true
        async {
            do {
                try await dependencies.authenticator.signin(
                    email: credentials.email,
                    password: credentials.password
                )
                
                let facts = try await dependencies.facts.fetchFacts()
                let myGarden = try await dependencies.myGarden.fetchMyGarden()
                
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
