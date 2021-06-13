//
//  Created by Maciej Gorecki on 13/06/2021.
//

import Foundation

class FactsStore: ObservableObject {
    @Published var facts: [Fact] = [
        .init(
            title: "Some fact 1",
            content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        ),
        .init(
            title: "Some fact 2",
            content: "written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, comes from a line in section 1.10.32."
        ),
        .init(
            title: "Some fact 3",
            content: "All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words"
        )
    ]
    
    func toggleFacts() {
        var newFacts = facts
        let first = newFacts.removeFirst()
        newFacts.append(first)
        self.facts = newFacts
    }
}

struct Fact: Identifiable {
    let id = UUID()
    let title: String
    let content: String
}
