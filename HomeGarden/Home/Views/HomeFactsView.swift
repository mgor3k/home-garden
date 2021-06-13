//
//  Created by Maciej Gorecki on 13/06/2021.
//

import SwiftUI

struct HomeFactsView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Did you know...")
                .bold()
                .font(.title3)
        }
    }
}

struct HomeFactsView_Previews: PreviewProvider {
    static var previews: some View {
        HomeFactsView()
    }
}
