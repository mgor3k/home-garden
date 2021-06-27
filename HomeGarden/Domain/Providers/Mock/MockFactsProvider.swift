//
//  Created by Maciej Gorecki on 19/06/2021
//

import Foundation

struct MockFactsProvider: FactsProviding {
    func fetchFacts() async throws -> [Fact] {
        await withUnsafeContinuation { continuation in
            DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
                continuation.resume(returning: [
                    .init(
                        id: "1",
                        title: "Some fact 1",
                        content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
                    ),
                    .init(
                        id: "2",
                        title: "Some fact 2",
                        content: "written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, comes from a line in section 1.10.32."
                    ),
                    .init(
                        id: "3",
                        title: "Some fact 3",
                        content: "All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words"
                    )
                ])
            }
        }
    }
}
