//
//  Created by Maciej Gorecki on 13/06/2021.
//

import Foundation

class FactsStore: ObservableObject {
    @Published var facts: [Fact]
    
    init(facts: [Fact]) {
        self.facts = facts
    }
    
    func toggleFacts() {
        var newFacts = facts
        let first = newFacts.removeFirst()
        newFacts.append(first)
        self.facts = newFacts
    }
}
