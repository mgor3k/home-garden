//
//  Created by Maciej Gorecki on 19/06/2021
//

import Foundation

class HomeStore: ObservableObject {
    let facts: [Fact]
    
    init(facts: [Fact]) {
        self.facts = facts
    }
}
