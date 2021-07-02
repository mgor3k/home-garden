//
//  Created by Maciej Gorecki on 02/07/2021
//

import Foundation

struct FirebaseAuthenticator {
    let apiKey: String
    let networkClient: NetworkClient
}

extension FirebaseAuthenticator: Authenticating {
    func signin(credentials: AuthCredentials) async throws {
        try await networkClient.execute(
            FirebaseSigninEndpoint(
                apiKey: apiKey,
                request: .init(
                    email: credentials.email,
                    password: credentials.password
                )
            )
        )
    }
    
    func signup(credentials: AuthCredentials) async throws {
    }
}
