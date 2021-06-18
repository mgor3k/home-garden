//
//  Created by Maciej Gorecki on 18/06/2021
//

import SwiftUI

struct TabItem: View {
    let page: Page
    @Binding var currentPage: Page
    
    var body: some View {
        Image(systemName: page.imageName)
            .resizable()
            .scaledToFit()
            .frame(width: 22, height: 22)
            .frame(maxWidth: .infinity)
            .foregroundColor(page == currentPage ? .accentColor : .black)
            .onTapGesture {
                currentPage = page
            }
    }
}

struct TabItem_Previews: PreviewProvider {
    static var previews: some View {
        TabItem(page: .home, currentPage: .constant(.home))
    }
}
