//
//  Created by Maciej Gorecki on 19/06/2021
//

import SwiftUI

struct ProfileView: View {
    let onLogoutTapped: () -> Void
    
    var body: some View {
        Button("Logout", action: onLogoutTapped)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(onLogoutTapped: {})
    }
}
