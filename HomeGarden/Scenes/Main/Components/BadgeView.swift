//
//  Created by Maciej Gorecki on 27/06/2021
//

import SwiftUI

struct BadgeView: View {
    let badge: Badge
    
    var body: some View {
        badge.color
            .frame(width: 16, height: 16)
            .clipShape(Circle())
            .overlay(
                Text("\(badge.count)")
                    .foregroundColor(.white)
                    .font(.system(size: 12))
            )
    }
}

struct BadgeView_Previews: PreviewProvider {
    static var previews: some View {
        BadgeView(badge: .init(count: 3, color: .blue))
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
