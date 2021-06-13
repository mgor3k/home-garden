//
//  Created by Maciej Gorecki on 13/06/2021.
//

import SwiftUI

struct HomeFactsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Did you know...")
                .bold()
                .font(.title3)
            
            FactView()
                .frame(height: 150)
                .rotationEffect(.degrees(-1))
        }
    }
}

struct HomeFactsView_Previews: PreviewProvider {
    static var previews: some View {
        HomeFactsView()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding()
    }
}
