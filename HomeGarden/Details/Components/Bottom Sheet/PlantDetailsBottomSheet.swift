//
//  Created by Maciej Gorecki on 19/06/2021
//

import SwiftUI

struct PlantDetailsBottomSheet: View {
    @State var currentItem: PlantDetailsMenuItem = .more
    
    var body: some View {
        VStack {
            PlantDetailsMenu(
                items: PlantDetailsMenuItem.allCases,
                selectedItem: $currentItem
            )
                .padding(24)
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
    }
}

struct PlantDetailsBottomSheet_Previews: PreviewProvider {
    static var previews: some View {
        PlantDetailsBottomSheet()
    }
}
