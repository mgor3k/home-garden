//
//  Created by Maciej Gorecki on 02/07/2021
//

import Foundation

struct FirebaseFactsEndpoint: Endpoint {
    typealias Response = [Fact]
    
    var url: String {
        "https://homegarden-519db-default-rtdb.firebaseio.com/facts.json"
    }
}
