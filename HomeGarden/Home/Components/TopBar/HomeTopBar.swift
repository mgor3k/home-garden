//
//  Created by Maciej Gorecki on 13/06/2021.
//

import SwiftUI

struct HomeTopBar: View {
    let tasksCount: Int
    let onSearchTapped: () -> Void
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("Good morning!")
                    .bold()
                    .font(.title3)
                
                Text("\(tasksCount) \(Text("tasks today").foregroundColor(.gray))")
                    .bold()
                .font(.subheadline)
            }
            Spacer()
            IconButton(icon: .search, action: onSearchTapped)
            Image("avatar")
                .resizable()
                .frame(width: 44, height: 44)
                .clipShape(Circle())
        }
    }
}

struct HomeTopBar_Previews: PreviewProvider {
    static var previews: some View {
        HomeTopBar(
            tasksCount: 0,
            onSearchTapped: {}
        )
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
