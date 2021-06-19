//
//  Created by Maciej Gorecki on 19/06/2021
//

import SwiftUI

extension View {
    func defaultShadow() -> some View {
        shadow(color: .gray.opacity(0.3), radius: 20, x: 0, y: 0)
    }
}
