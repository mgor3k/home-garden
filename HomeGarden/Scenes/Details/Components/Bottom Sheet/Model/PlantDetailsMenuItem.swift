//
//  Created by Maciej Gorecki on 19/06/2021
//

import Foundation

enum PlantDetailsMenuItem: String, Identifiable, CaseIterable {
    case more
    case tips
    case activity
    case calendar
}

extension PlantDetailsMenuItem {
    var id: String {
        rawValue
    }
    
    var title: String {
        switch self {
        case .more:
            return "More"
        case .tips:
            return "Tips"
        case .activity:
            return "Activity"
        case .calendar:
            return "Calendar"
        }
    }
}
