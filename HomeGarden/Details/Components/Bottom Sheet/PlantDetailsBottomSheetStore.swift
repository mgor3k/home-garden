//
//  Created by Maciej Gorecki on 19/06/2021
//

import Foundation

class PlantDetailsBottomSheetStore: ObservableObject {
    let items: [PlantDetailsMenuItem] = PlantDetailsMenuItem.allCases
    @Published var currentItem: PlantDetailsMenuItem = .more
}
