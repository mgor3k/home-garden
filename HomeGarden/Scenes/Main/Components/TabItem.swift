//
//  Created by Maciej Gorecki on 18/06/2021
//

import SwiftUI

struct TabItem: View {
    let page: Page
    @Binding var currentPage: Page
    
    var badge: Badge?
    
    var body: some View {
        Image(systemName: page.imageName)
            .resizable()
            .scaledToFit()
            .frame(width: 22, height: 22)
            .foregroundColor(page == currentPage ? .accentColor : .black)
            .onTapGesture {
                currentPage = page
            }
            .overlay(
                badge != nil ? BadgeView(badge: badge!).offset(x: 6, y: -6) : nil,
                alignment: .topTrailing
            )
            .frame(maxWidth: .infinity)
    }
}

struct TabItem_Previews: PreviewProvider {
    static var previews: some View {
        TabItem(page: .home, currentPage: .constant(.home))
            .previewLayout(.fixed(width: 44, height: 44))
        
        TabItem(
            page: .home,
            currentPage: .constant(.home),
            badge: .init(count: 3, color: .blue)
        )
            .previewLayout(.fixed(width: 44, height: 44))
    }
}
