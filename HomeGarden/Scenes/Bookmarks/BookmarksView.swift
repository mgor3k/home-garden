//
//  Created by Maciej Gorecki on 27/06/2021
//

import SwiftUI

struct BookmarksView: View {
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            
            Text("Bookmarks should be here")
                .bold()
        }
    }
}

struct BookmarksView_Previews: PreviewProvider {
    static var previews: some View {
        BookmarksView()
    }
}
