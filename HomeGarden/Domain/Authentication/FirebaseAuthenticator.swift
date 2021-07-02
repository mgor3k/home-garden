//
//  Created by Maciej Gorecki on 02/07/2021
//

import Foundation

enum NetworkError: Error {
    case invalid(response: HTTPURLResponse)
    case unknown
}

struct FirebaseAuthenticator {
    let apiKey: String
}

extension FirebaseAuthenticator: Authenticating {
    // TODO: Make proper networking
    func signin(credentials: AuthCredentials) async throws {
        struct Request: Encodable {
            let email: String
            let password: String
            let returnSecureToken = true
        }
        
        let url = URL(string: "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=\(apiKey)")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = try JSONEncoder().encode(Request(email: credentials.email, password: credentials.password))
        request.allHTTPHeaderFields = ["content-type": "application/json"]
        
        let (_, response) = try await URLSession.shared.data(for: request, delegate: nil)
                
        guard let httpResponse = (response as? HTTPURLResponse) else { throw NetworkError.unknown }
        guard 200..<300 ~= httpResponse.statusCode else {
            throw NetworkError.invalid(response: httpResponse)
        }
    }
    
    func signup(credentials: AuthCredentials) async throws {
    }
}
