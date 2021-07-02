//
//  Created by Maciej Gorecki on 02/07/2021
//

import Foundation

protocol SigninHandler {
    func signin(email: String, password: String) async throws
}

protocol SignupHandler {
    func signup(email: String, password: String) async throws
}

typealias Authenticating = SignupHandler & SigninHandler
