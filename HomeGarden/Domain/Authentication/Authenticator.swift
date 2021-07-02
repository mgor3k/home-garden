//
//  Created by Maciej Gorecki on 02/07/2021
//

import Foundation

protocol SigninHandler {
    func signin(credentials: AuthCredentials) async throws
}

protocol SignupHandler {
    func signup(credentials: AuthCredentials) async throws
}

typealias Authenticating = SignupHandler & SigninHandler
