//
//  Created by Maciej Gorecki on 19/06/2021
//

import SwiftUI
import ActivityIndicatorView

struct LoaderView: View {
    @Binding var isVisible: Bool
    
    var body: some View {
        ZStack {
            ActivityIndicatorView(
                isVisible: $isVisible,
                type: .flickeringDots
            )
                .frame(width: 44, height: 44)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Material.ultraThin)
        .opacity(isVisible ? 1 : 0)
        .animation(.default, value: isVisible)
    }
}

struct LoaderView_Previews: PreviewProvider {
    static var previews: some View {
        LoaderView(isVisible: .constant(true))
            .background(Color.blue)
    }
}
