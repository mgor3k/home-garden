//
//  Created by Maciej Gorecki on 19/06/2021
//

import SwiftUI

struct ProfileView: View {
    let onLogoutTapped: () -> Void
    
    var body: some View {
        NavigationView {
            content
                .navigationTitle("PROFILE_TITLE")
        }
    }
    
    var content: some View {
        Button(action: onLogoutTapped) {
            Text("PROFILE_LOGOUT")
                .frame(width: 200, height: 32)
        }
        .buttonStyle(.bordered)
        .tint(.accentColor)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(onLogoutTapped: {})
    }
}
