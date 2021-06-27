//
//  Created by Maciej Gorecki on 13/06/2021
//

import SwiftUI

struct MyGardenStore {
    let plants: [Plant]
    
    func isPlantLast(_ plant: Plant) -> Bool {
        plant == plants[plants.count - 1]
    }
    
    func isPlantFirst(_ plant: Plant) -> Bool {
        plant == plants.first
    }
}
