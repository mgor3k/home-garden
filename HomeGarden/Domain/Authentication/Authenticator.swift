//
//  Created by Maciej Gorecki on 02/07/2021
//

import Foundation

protocol Authenticator {
    func signin(using credentials: AuthCredentials) async throws
    func signup(using credentials: AuthCredentials) async throws
    
    var isAuthenticated: Bool { get }
    func logout()
}
