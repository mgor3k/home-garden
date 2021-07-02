//
//  Created by Maciej Gorecki on 19/06/2021
//

import Foundation

class AppState: ObservableObject {
    @Published var current: State = .launching
    @Published var isLoading = false
        
    private let dependencies: Dependencies
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        setInitialState()
    }
    
    func login(credentials: AuthCredentials) {
        isLoading = true
        async {
            do {
                try await authenticator.signin(using: credentials)
                let home = try await fetchHome()
                await didLogin(store: home)
                
            } catch {
                await errorOccured(error)
            }
        }
    }
    
    func logout() {
        authenticator.logout()
        current = .onboarding
    }
}

private extension AppState {
    var authenticator: Authenticator {
        dependencies.authenticator
    }
    
    @MainActor
    func didLogin(store: MainStore) {
        isLoading = false
        current = .running(store)
    }
    
    @MainActor
    func errorOccured(_ error: Error) {
        print(error)
        isLoading = false
        // TODO: Add error handling
    }
    
    func setInitialState() {
        guard authenticator.isAuthenticated else {
            current = .onboarding
            return
        }
        
        isLoading = true
            
        async {
            do {
                let home = try await fetchHome()
                await didLogin(store: home)
            } catch {
                await errorOccured(error)
            }
        }
    }
    
    func fetchHome() async throws -> MainStore {
        let facts = try await dependencies.facts.fetchFacts()
        let myGarden = try await dependencies.myGarden.fetchMyGarden()
        return .init(facts: facts, myGarden: myGarden)
    }
}

extension AppState {
    enum State {
        case launching
        case onboarding
        case running(MainStore)
    }
}
