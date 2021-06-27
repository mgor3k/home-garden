//
//  Created by Maciej Gorecki on 27/06/2021
//

import SwiftUI

struct NotificationsView: View {
    var body: some View {
        ZStack {
            Color.red
                .ignoresSafeArea()
            
            Text("Notifications should be here")
                .bold()
        }
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
