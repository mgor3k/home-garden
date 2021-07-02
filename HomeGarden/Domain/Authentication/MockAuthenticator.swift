//
//  Created by Maciej Gorecki on 02/07/2021
//

import Foundation

struct MockAuthenticator: Authenticator {
    var isAuthenticated: Bool {
        false
    }
    
    func logout() {
        // Nothing to do here
    }
    
    func signup(using credentials: AuthCredentials) async throws {
        // Not needed now
    }
    
    func signin(using credentials: AuthCredentials) async throws {
        await withCheckedContinuation { continuation in
            DispatchQueue.global().asyncAfter(deadline: .now() + 0.5) {
                continuation.resume(returning: ())
            }
        }
    }
}
