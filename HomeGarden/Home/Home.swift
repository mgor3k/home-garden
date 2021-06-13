//
//  Created by Maciej Gorecki on 13/06/2021.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            HomeTopBar(
                tasksCount: 2,
                onSearchTapped: {}
            )
            .padding(.horizontal, 24)
            
            // TODO: Fix this later
            FactsView(store: FactsStore())
                .padding(24)
            
            MyGardenList()
            
            Spacer()
        }
        .padding(.vertical, 24)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
