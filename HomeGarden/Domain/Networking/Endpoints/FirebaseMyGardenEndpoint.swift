//
//  Created by Maciej Gorecki on 02/07/2021
//

import Foundation

struct FirebaseMyGardenEndpoint: Endpoint {
    typealias Response = [Plant]
    
    var url: String {
        "https://homegarden-519db-default-rtdb.firebaseio.com/plants.json"
    }
}
