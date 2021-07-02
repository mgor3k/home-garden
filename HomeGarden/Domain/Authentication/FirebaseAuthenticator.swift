//
//  Created by Maciej Gorecki on 02/07/2021
//

import Foundation

struct FirebaseAuthenticator {
    private let storageKey = "isAuthenticated"
    let apiKey: String
    let networkClient: NetworkClient
    let storage: Storage
}

extension FirebaseAuthenticator: Authenticator {
    func signin(using credentials: AuthCredentials) async throws {
        try await networkClient.execute(
            FirebaseSigninEndpoint(
                apiKey: apiKey,
                request: .init(
                    email: credentials.email,
                    password: credentials.password
                )
            )
        )
        storage.store(true, key: storageKey)
    }
    
    func signup(using credentials: AuthCredentials) async throws {
        // TODO: To be implemented
    }
    
    var isAuthenticated: Bool {
        storage.read(key: storageKey) ?? false
    }
    
    func logout() {
        storage.store(false, key: storageKey)
    }
}
