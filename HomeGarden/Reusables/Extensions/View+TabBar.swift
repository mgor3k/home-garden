//
//  Created by Maciej Gorecki on 19/06/2021
//

import SwiftUI

extension View {
    func hidesTabBar() -> some View {
        self.onAppear {
            UITabBar.appearance().isHidden = true
        }
    }
}
