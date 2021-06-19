//
//  Created by Maciej Gorecki on 19/06/2021
//

import SwiftUI

struct MockSignInWithAppleButton: View {
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 16) {
                Image(systemName: "applelogo")
                Text("Sign In With Apple")
            }
        }
        .padding()
        .background(Color.white)
    }
}

struct MockSignInWithAppleButton_Previews: PreviewProvider {
    static var previews: some View {
        MockSignInWithAppleButton(action: {})
    }
}
