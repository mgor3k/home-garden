//
//  Created by Maciej Gorecki on 02/07/2021
//

import Foundation

struct MockAuthenticator: Authenticating {
    func signup(email: String, password: String) async throws {
        
    }
    
    func signin(email: String, password: String) async throws {
        await withCheckedContinuation { continuation in
            DispatchQueue.global().asyncAfter(deadline: .now() + 0.5) {
                continuation.resume(returning: ())
            }
        }
    }
}
