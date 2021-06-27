//
//  Created by Maciej Gorecki on 19/06/2021
//

import Foundation

class MainStore: ObservableObject {
    @Published var facts: [Fact]
    @Published var myGarden: [Plant]
    
    init(
        facts: [Fact],
        myGarden: [Plant]
    ) {
        self.facts = facts
        self.myGarden = myGarden
    }
}
