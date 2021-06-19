//
//  Created by Maciej Gorecki on 18/06/2021
//

import SwiftUI

struct PlantDetailsNavigationBar: View {
    let onDismiss: (() -> Void)
    
    var body: some View {
        HStack {
            Button(action: onDismiss) {
                Image(systemName: "arrow.left")
            }
            Spacer()
            Button(action: {}) {
                Image(systemName: "bookmark")
            }
        }
        .font(.title2)
        .padding(32)
    }
}

struct PlantDetailsNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        PlantDetailsNavigationBar(onDismiss: {})
    }
}
