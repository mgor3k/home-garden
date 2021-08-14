//
//  Created by Maciej Gorecki on 02/07/2021
//

import Foundation

struct FirebaseSigninEndpoint: Endpoint {
    struct Request: Encodable {
        let email: String
        let password: String
        let returnSecureToken = true
    }
    
    typealias Response = Void
    
    let apiKey: String
    let request: Request
    
    var url: String {
        "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=\(apiKey)"
    }
    
    var method: HTTPMethod {
        .post
    }
    
    func body() throws -> Data? {
        try JSONEncoder().encode(request)
    }
}
