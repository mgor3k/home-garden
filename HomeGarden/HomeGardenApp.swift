//
//  Created by Maciej Gorecki on 13/06/2021.
//

import SwiftUI

@main
struct HomeGardenApp: App {
    // TODO: Temporary until authentication is presented
    @State var isLoggedIn = false
    
    var body: some Scene {
        WindowGroup {
            if isLoggedIn {
                MainView(
                    onLogoutTapped: { isLoggedIn = false }
                )
            } else {
                OnboardingView(
                    didLogin: { isLoggedIn = true }
                )
            }
        }
    }
}
